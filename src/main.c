/*
STM32F1 DFU

Copyright (C) 2022 Hew How Chee <howchee@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 */

#include <string.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/flash.h>
#include <libopencm3/cm3/scb.h>
#include <libopencm3/usb/usbd.h>
#include <libopencm3/usb/dfu.h>
#include "../libopencm3/lib/usb/usb_private.h"
#include "../libopencm3/lib/stm32/common/st_usbfs_core.h"
#define APP_ADDRESS	(FLASH_BASE + 0x1c)
/* Commands sent with wBlockNum == 0 as per ST implementation. */
#define CMD_SETADDR	0x21
#define CMD_ERASE	0x41
/* We need a special large control buffer for this device: */
uint8_t usbd_control_buffer[1024];
//uint8_t written;
enum dfu_state usbdfu_state = STATE_DFU_IDLE;

struct {
	uint8_t buf[sizeof(usbd_control_buffer)];
	uint16_t len;
	uint32_t addr;
	uint16_t blocknum;
} prog;

const struct usb_device_descriptor dev = {
	.bLength = USB_DT_DEVICE_SIZE,
	.bDescriptorType = USB_DT_DEVICE,
	.bcdUSB = 0x0200,
	.bDeviceClass = 0,
	.bDeviceSubClass = 0,
	.bDeviceProtocol = 0,
	.bMaxPacketSize0 = 64,
	.idVendor = 0x0483,
	.idProduct = 0xDF11,
	.bcdDevice = 0x0200,
	.iManufacturer = 1,
	.iProduct = 2,
	.iSerialNumber = 3,
	.bNumConfigurations = 1,
};

const struct usb_dfu_descriptor dfu_function = {
	.bLength = sizeof(struct usb_dfu_descriptor),
	.bDescriptorType = DFU_FUNCTIONAL,
	.bmAttributes = USB_DFU_CAN_DOWNLOAD | USB_DFU_WILL_DETACH,
	.wDetachTimeout = 255,
	.wTransferSize = 1024,
	.bcdDFUVersion = 0x011A,
};

/*const*/ struct usb_interface_descriptor iface = {
	.bLength = USB_DT_INTERFACE_SIZE,
	.bDescriptorType = USB_DT_INTERFACE,
	.bInterfaceNumber = 0,
	.bAlternateSetting = 0,
	.bNumEndpoints = 0,
	.bInterfaceClass = 0xFE, /* Device Firmware Upgrade */
	.bInterfaceSubClass = 1,
	.bInterfaceProtocol = 2,

	/* The ST Microelectronics DfuSe application needs this string.
	 * The format isn't documented... */
	.iInterface = 4,

	.extra = &dfu_function,
	.extralen = sizeof(dfu_function),
};

 struct usb_interface ifaces[] = {{
	.num_altsetting = 1,
	.altsetting = &iface,
}};

 struct usb_config_descriptor config = {
	.bLength = USB_DT_CONFIGURATION_SIZE,
	.bDescriptorType = USB_DT_CONFIGURATION,
	.wTotalLength = 0,
	.bNumInterfaces = 1,
	.bConfigurationValue = 1,
	.iConfiguration = 0,
	.bmAttributes = 0xC0,
	.bMaxPower = 0x32,

	.interface = ifaces,
};

 char dfuse_str[60];
 char serial_str[30];
#if 0
char * usb_strings[] = {
	"Black Sphere Technologies",
	"DFU Demo",
	"DEMO",
	/* This string is used by ST Microelectronics' DfuSe utility. */
	dfuse_str
//	"@Internal Flash   /0x08000000/8*001Ka,56*001Kg",
};
#else
__attribute__((used)) static const char * usb_strings[4] ;

#endif
static uint8_t usbdfu_getstatus(usbd_device *usbd_dev, uint32_t *bwPollTimeout)
{
	(void)usbd_dev;

	switch (usbdfu_state) {
	case STATE_DFU_DNLOAD_SYNC:
		usbdfu_state = STATE_DFU_DNBUSY;
		*bwPollTimeout = 100;
		return DFU_STATUS_OK;
	case STATE_DFU_MANIFEST_SYNC:
		/* Device will reset when read is complete. */
		usbdfu_state = STATE_DFU_MANIFEST;
		return DFU_STATUS_OK;
	default:
		return DFU_STATUS_OK;
	}
}

static void usbdfu_getstatus_complete(usbd_device *usbd_dev, struct usb_setup_data *req)
{
	int i;
	(void)req;
	(void)usbd_dev;

	switch (usbdfu_state) {
	case STATE_DFU_DNBUSY:
		flash_unlock();
		if (prog.blocknum == 0) {
			switch (prog.buf[0]) {
			case CMD_ERASE:
				{
					uint32_t *dat = (uint32_t *)(prog.buf + 1);
					if(*dat == (FLASH_BASE)) {
						//skip it
					} else {
						flash_erase_page(*dat);
					}
				}
				break;
			case CMD_SETADDR:
				{
					uint32_t *dat = (uint32_t *)(prog.buf + 1);
					prog.addr = *dat;
				}
				break;
			}
		} else {
			uint32_t t1,t2;
			uint32_t baseaddr = prog.addr + ((prog.blocknum - 2) *
				       dfu_function.wTransferSize);
			if(baseaddr == (FLASH_BASE)) {// && baseaddr < (FLASH_BASE + page_nb_size)) {
				//memcpy(prog.page0, prog.buf, prog.len);
				//prog.page0_size = prog.len;


				if(*((uint32_t *)(&prog.buf[0x1c])) == 0
						&& *((uint32_t *)(&prog.buf[0x20])) == 0) {
					t1 = *(uint32_t *)FLASH_BASE;
					t2 = *(uint32_t *)(FLASH_BASE + 4);
					flash_erase_page(FLASH_BASE);
					*(uint32_t *)(&prog.buf[0x1c]) = *(uint32_t *)(&prog.buf[0]);
					*(uint32_t *)(&prog.buf[0x20]) = *(uint32_t *)(&prog.buf[4]);
					*(uint32_t *)(&prog.buf[0]) = t1;
					*(uint32_t *)(&prog.buf[4]) = t2;
				}
			}
			//written = 1;
			for (i = 0; i < prog.len; i += 2) {
				uint16_t *dat = (uint16_t *)(prog.buf + i);
				flash_program_half_word(baseaddr + i,
						*dat);
			}

		}
		flash_lock();

		/* Jump straight to dfuDNLOAD-IDLE, skipping dfuDNLOAD-SYNC. */
		usbdfu_state = STATE_DFU_DNLOAD_IDLE;
		return;
	case STATE_DFU_MANIFEST:
		/* USB device must detach, we just reset... */
		scb_reset_system();
		return; /* Will never return. */
	default:
		return;
	}
}
static void usbdfu_usb_reset(void)//usbd_device *usbd_dev, uint16_t wValue)
{
	//if(written)
	scb_reset_system();
	while(1);
}

static enum usbd_request_return_codes usbdfu_standard_request(usbd_device *usbd_dev, struct usb_setup_data *req, uint8_t **buf,
		uint16_t *len, void (**complete)(usbd_device *usbd_dev, struct usb_setup_data *req))
{
	usbd_register_reset_callback(usbd_dev, usbdfu_usb_reset);
}
static enum usbd_request_return_codes usbdfu_control_request(usbd_device *usbd_dev, struct usb_setup_data *req, uint8_t **buf,
		uint16_t *len, void (**complete)(usbd_device *usbd_dev, struct usb_setup_data *req))
{
	if ((req->bmRequestType & 0x7F) != 0x21)
		return USBD_REQ_NOTSUPP; /* Only accept class request. */

	switch (req->bRequest) {
	case DFU_DNLOAD:
		if ((len == NULL) || (*len == 0)) {
			usbdfu_state = STATE_DFU_MANIFEST_SYNC;
		} else {
			/* Copy download data for use on GET_STATUS. */
			prog.blocknum = req->wValue;
			prog.len = *len;
			memcpy(prog.buf, *buf, *len);
			usbdfu_state = STATE_DFU_DNLOAD_SYNC;
		}
		return USBD_REQ_HANDLED;
	case DFU_CLRSTATUS:
		/* Clear error and return to dfuIDLE. */
		if (usbdfu_state == STATE_DFU_ERROR)
			usbdfu_state = STATE_DFU_IDLE;
		return USBD_REQ_HANDLED;
	case DFU_ABORT:
		/* Abort returns to dfuIDLE state. */
		usbdfu_state = STATE_DFU_IDLE;
		return USBD_REQ_HANDLED;
	case DFU_UPLOAD:
		/* Upload not supported for now. */
		return USBD_REQ_NOTSUPP;
	case DFU_GETSTATUS: {
		uint32_t bwPollTimeout = 0; /* 24-bit integer in DFU class spec */
		(*buf)[0] = usbdfu_getstatus(usbd_dev, &bwPollTimeout);
		(*buf)[1] = bwPollTimeout & 0xFF;
		(*buf)[2] = (bwPollTimeout >> 8) & 0xFF;
		(*buf)[3] = (bwPollTimeout >> 16) & 0xFF;
		(*buf)[4] = usbdfu_state;
		(*buf)[5] = 0; /* iString not used here */
		*len = 6;
		*complete = usbdfu_getstatus_complete;
		return USBD_REQ_HANDLED;
		}
	case DFU_GETSTATE:
		/* Return state with no state transision. */
		*buf[0] = usbdfu_state;
		*len = 1;
		return USBD_REQ_HANDLED;
	}

	return USBD_REQ_NOTSUPP;
}

static void usbdfu_set_config(usbd_device *usbd_dev, uint16_t wValue)
{
	(void)wValue;

	usbd_register_control_callback(
				usbd_dev,
				USB_REQ_TYPE_CLASS | USB_REQ_TYPE_INTERFACE,
				USB_REQ_TYPE_TYPE | USB_REQ_TYPE_RECIPIENT,
				usbdfu_control_request);


	usbd_register_control_callback(
					usbd_dev,
					USB_REQ_TYPE_STANDARD,
					USB_REQ_TYPE_STANDARD,
					usbdfu_standard_request);
}

void flash_check(void)  __attribute__ ((section ("move_it_sect")));
unsigned int get_flash_size(void)  __attribute__ ((section ("move_it_sect")));
void move_it(void)  __attribute__ ((section ("move_it_sect")));
int main(void)  __attribute__ ((section ("move_it_sect")));
void reset_handler(void)  __attribute__ ((section ("move_it_sect_first")));

unsigned int get_flash_size()
{
	unsigned int sz = (unsigned int)*((unsigned short *)(0x1ffff7e0));
	sz *= 1024;

	return sz;

}
extern void * _estack;
extern void * vector_table;
extern void * __etext;
extern void * _ebss;
extern void * _data;
extern void * _edata;
extern void * _data_loadaddr;
void flash_check()
{
	unsigned int flash_status;
	flash_status = flash_get_status_flags();
	if(flash_status != FLASH_SR_EOP) {
		//hang on unexpected result
		while(1);
	}

					;

}
//int g_ofs;
void num2str(unsigned int n, char outstr[12])
{
	char tmp[12];
	int pos = 0;
	unsigned int r;
	if(n == 0) {
		outstr[0] = '0';
		return;
	}
	while(n != 0) {
		r = n % 10;
		tmp[pos++] = '0' + r;
		n /= 10;
	}
	while(pos > 0) {
		pos--;
		*outstr = tmp[pos];
		outstr++;
	}
	*outstr = 0;

}
 void nibble2str(unsigned char v, char *p)
 {
	 if(v > 9) {
		 *p = v - 10 + 'A';
	 } else {
		 *p = '0' + v;
	 }
 }
void gen_serial()
{
	const unsigned char *p = (const unsigned char *)0x1ffff7e8;
	char *q = serial_str;
	int i;
	unsigned char v;
	for(i = 11;i >= 0; i--) {
		v = p[i];
		nibble2str(v >> 4, q++);
		nibble2str(v & 0xf, q++);
	}
	*q = 0;

}
void move_it()
{

	register unsigned int r1 asm("r1");
	unsigned int etext;// = (unsigned int)&__etext;
	unsigned int f_size = get_flash_size();
	unsigned int val;
	int nb;
	int cnt;
	volatile unsigned int *src = FLASH_BASE;
	volatile unsigned int *dest;
	unsigned int *dest_org;// = dest;
	unsigned char *rst_handler =  reset_handler;//*(unsigned char **)(FLASH_BASE + 4);
	unsigned char *ptr;
	char buff[12];



	asm("ldr r1,=_etext");

	etext = r1;
	nb = (int)(((etext + 1023) & ~0x3ff) - FLASH_BASE);
	dest = FLASH_BASE + f_size - nb;
	dest_org = dest;

	strcpy(dfuse_str,"@Internal Flash   /0x08000000/");//8*001Kg,56*001Ka");
	num2str((f_size - nb) / 1024, buff);
	//num2str((f_size - nb) / 2048, buff);
	strcat(dfuse_str,buff);
	strcat(dfuse_str, "*001Kg,");
	num2str(nb / 1024, buff);
	//num2str(nb / 2048, buff);
	strcat(dfuse_str,buff);
	strcat(dfuse_str, "*001Ka");



	if(rst_handler > dest) {
		return;

	}

	flash_unlock();
	ptr = dest;
	while(ptr < (FLASH_BASE + f_size)) {
		flash_erase_page(ptr);
		flash_check();
		ptr += 1024;
	}
	cnt = nb;
	while(cnt > 0) {
		if(src == FLASH_BASE) {
			val = &_estack;
		} else if(src == (FLASH_BASE + 4)) {
			//val = reset_handler;
			val = (unsigned int)rst_handler + f_size - nb;
		} else if(src >= (FLASH_BASE + 8) && src < (FLASH_BASE + 0x1c)) {

			val = *src + f_size - nb;

		} else if(src >= (FLASH_BASE + 0x1c) && src < (FLASH_BASE + 0x24)) {
			val = 0;
		} else {
			val = *src;
		}
	//		val = f_size - nb;
		//} else {
			//val = 0;
		//}
		//val = 0;
		//flash_program_word(dest, *src + val);
		flash_program_word(dest, val);
		flash_check();
		if(*dest != val) {
			while(1);
		}
		src++;
		dest++;
		cnt -= 4;
	}

	flash_erase_page(FLASH_BASE);
	flash_check();
	dest = dest_org;
	src = FLASH_BASE;
	for(cnt = 0; cnt < 7; cnt++) {
		val = ((unsigned int)dest[cnt]);
		//if(cnt != 0) {
			//val += f_size - nb;
		//}
		flash_program_word(&src[cnt], val);
	}

	flash_lock();
	//for(cnt = 0; cnt <500000000;cnt++);
	scb_reset_system();

}

typedef void (*funcp_t) (void);
extern funcp_t __preinit_array_start, __preinit_array_end;
extern funcp_t __init_array_start, __init_array_end;
extern funcp_t __fini_array_start, __fini_array_end;
//__attribute__((used)) const unsigned int eedata = &_data_loadaddr ;
//extern const void * const eedata;
extern void *__data_regions_array_start;

void reset_handler(void)
{
	volatile unsigned *src, *dest, *destend, *bssend;
	funcp_t *fp;
	register unsigned int r1 asm("r1");

	int ofs;
	asm("mov r1,pc");
	fp = (r1 & ~31) | 1;
	asm("ldr r1,=__ram_start");
	dest = r1;
	asm("mov r1,sp");
	destend = r1;
	while(dest < destend) {
		*dest++ = 0;
	}
	asm("ldr r9,=__rgot_begin");
	//fp = *(void **)(FLASH_BASE + 4);
	asm("ldr r1,=reset_handler");
	ofs = (unsigned int)fp - r1;


	asm("ldr r1,=__fgot_begin");
	src = r1 + ofs;
	asm("ldr r1,=__rgot_begin");
	dest = r1;
	asm("ldr r1,=__rgot_end");
	destend = r1;
	while(dest < destend) {
		if(*src < 0x20000000) {
			*dest++ = ((unsigned int)*src++) + ofs;
		} else {
			*dest++ = *src++;
		}

	}


	src = &_data_loadaddr;
	dest = &_data;
	for (src = &_data_loadaddr, dest = &_data;
		dest < &_edata;
		src++, dest++) {
		*dest = *src;
	}

	/* Ensure 8-byte alignment of stack pointer on interrupts */
	/* Enabled by default on most Cortex-M parts, but not M3 r1 */
	SCB_CCR |= SCB_CCR_STKALIGN;

	(void)main();
}
const unsigned int diff = (unsigned int)&reset_handler;

/** Initialize the USB device controller hardware of the STM32. */
usbd_device *st_usbfs_v1_usbd_init_xx(void)
{
	rcc_periph_clock_enable(RCC_USB);
	SET_REG(USB_CNTR_REG, 0);
	SET_REG(USB_BTABLE_REG, 0);
	SET_REG(USB_ISTR_REG, 0);

	/* Enable RESET, SUSPEND, RESUME and CTR interrupts. */
	SET_REG(USB_CNTR_REG, USB_CNTR_RESETM | USB_CNTR_CTRM |
		USB_CNTR_SUSPM | USB_CNTR_WKUPM);
	return &st_usbfs_dev;
}

struct _usbd_driver usb_drv = {0};

int main(void)
{
	unsigned int c,d,e;
	const char **p;
	register unsigned int r1 asm("r1");
	usbd_device *usbd_dev;

	move_it();

	asm("ldr r1,=__ram_start");

	c = RCC_CSR;

	RCC_CSR = c | RCC_CSR_RMVF;

	if((c & (RCC_CSR_PORRSTF | RCC_CSR_PINRSTF)) == (RCC_CSR_PORRSTF | RCC_CSR_PINRSTF)
	|| (c & RCC_CSR_SFTRSTF)) {

		asm("nop");
		asm("nop");
		c = vector_table;
		d = *(uint32_t *)(FLASH_BASE + 0x20);
		e = *(uint32_t *)(FLASH_BASE + 0x1c);
		if(d >= FLASH_BASE && d < c &&
		e >= r1 && e <= (r1 + (96 * 1024))) {

			//user will see reset flags in RCC_CSR cleared

			asm volatile("msr msp, %0"::"g"
				     (*(volatile uint32_t *)APP_ADDRESS));
			/* Jump to application. */
			(*(void (**)())(APP_ADDRESS + 4))();


		}

	}

	gen_serial();

	rcc_periph_clock_enable(RCC_GPIOA);

	rcc_clock_setup_pll(&rcc_hse_configs[RCC_CLOCK_HSE8_72MHZ]);

	gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_50_MHZ,
		GPIO_CNF_OUTPUT_OPENDRAIN, GPIO12);
	gpio_clear(GPIOA, GPIO12);
	for(c = 0; c < 5000000; c++);
	gpio_set(GPIOA, GPIO12);

	config.interface = ifaces;
	ifaces[0].altsetting = &iface;
	iface.extra = &dfu_function;
	asm ("ldr r1,=usb_strings");
	p = r1;

	p[0] = "HCHEW";
	p[1] = "STM32 DFU Emulation";
	p[2] = serial_str;//"DEMO";
	/* This string is used by ST Microelectronics' DfuSe utility. */

	p[3] = dfuse_str;

	usb_drv.init = st_usbfs_v1_usbd_init_xx;
	usb_drv.set_address = st_usbfs_set_address;
	usb_drv.ep_setup = st_usbfs_ep_setup;
	usb_drv.ep_reset = st_usbfs_endpoints_reset;
	usb_drv.ep_stall_set = st_usbfs_ep_stall_set;
	usb_drv.ep_stall_get = st_usbfs_ep_stall_get;
	usb_drv.ep_nak_set = st_usbfs_ep_nak_set;
	usb_drv.ep_write_packet = st_usbfs_ep_write_packet;
	usb_drv.ep_read_packet = st_usbfs_ep_read_packet;
	usb_drv.poll = st_usbfs_poll;

	usbd_dev = usbd_init(&usb_drv, &dev, &config, p, 4, usbd_control_buffer, sizeof(usbd_control_buffer));
	usbd_register_set_config_callback(usbd_dev, usbdfu_set_config);
	//usbd_register_reset_callback(usbd_dev, usbdfu_usb_reset);
	while (1)
		usbd_poll(usbd_dev);
}
