# stm32f1_dfu

Another DFU for STM32F103C8T6 module
------------------------------------

Most non built-in DFU bootloader available today requires the firmware that is to be uploaded to the MCU to be offseted from the orgiin of FLASH base address. The offset is needed since the DFU bootloader is placed at the beginning of flash memory. Different DFU bootloader has different offset requirement and hence the firmware that is going to be uploaded needs to be recompile for different bootloader. 

This bootloader on the other hand will moved itself to end of flash so that existing firmware can be uploaded as it is without offseting from the beginning of flash.

The setback is that this bootloader will change the content of the vector table of the uploaded firmware. It replaces the intial stack pointer and the reset address of the uploaded firmware with its own pointer. The original stack pointer and reset address of the uploaded firmware is placed at offset 0x1C and 0x20. (address 0x800001c and 0x8000020 respectively). The 4 byte value at these address must be 0 in order for this bootloader to use it. By default, these address is unused and usually contains zeros.

After uploading the firmware, user can unplug and plug in again the STM32F103C8 module to run the uploaded firmware.

To go into DFU bootloader, press the reset button.

This DFU loader also can upgrade itself when a new version is avaialble. (using DFU)

The codes still is incomplete but is enough for dfu-util to load required firmware.

Although tested on STM32F103C8 only, this code should work also on any STM32F1xx MCU with 1k flash bank.

If anyone has tested it working on other STM32F10xxx MCU, please drop me an email.

The source is compiled using GNU Arm Embedded Toolchain 8-2019-q3-update.


Caveat
------

a) RAM content is not preserved across reset.

b) SCB_CCR reset source is cleared.

c) Max firmware size that can be uploaded is total flash memory size less 14k.


Building the DFU firmware image
-------------------------------
```
$ git clone --recursive https://github.com/h0wch33/stm32f1_dfu.git
$ cd stm32f1_dfu
$ make -C libopencm3 TARGETS='stm32/f1'
$ make -C Debug all
```


Flashing the DFU firmware to MCU
--------------------------------

Use openocd to flash it first time into the MCU (change the script files path as appropriate).

A compiled copy of the DFU firmware is included in the Debug folder.


```
$ openocd -f /usr/local/share/openocd/scripts/interface/stlink.cfg -f /usr/local/share/openocd/scripts/target/stm32f1x.cfg -c "program Debug/stm32f1_dfu.bin verify reset exit 0x8000000"
```

Using the DFU bootloader
------------------------

Press the reset button on the STM32F103C8T6 module and use dfu-util to upload the required firmware

e.g.
```
$ dfu-util -s 0x8000000 -D stm103v2.bin -R
```
In Linux, option -R will do a USB port reset and the DFU firmware will run the uploaded firmware straight away after flashing.


Output from dfu-tool 
--------------------
```
$ dfu-tool list


Found 0483:df11 [v2.0]:
 Protocol:      DfuSe
 Name:          STM32 DFU Emulation
 Serial:        6701173555518970066AFF53
 Mode:          DFU
 Status:        OK
 State:         dfuIDLE
 Transfer Size: 1.0 kB (1,024 bytes)
 Attributes:    can-download|will-detach
 ID:            0
  Name:         Internal Flash
  Region 0x00:  Zone:0, Sec#:0, Addr:0x08000000, Size:0x0400, Caps:0x7 [REW]
  Region 0x01:  Zone:0, Sec#:0, Addr:0x08000400, Size:0x0400, Caps:0x7 [REW]
  Region 0x02:  Zone:0, Sec#:0, Addr:0x08000800, Size:0x0400, Caps:0x7 [REW]
  Region 0x03:  Zone:0, Sec#:0, Addr:0x08000c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x04:  Zone:0, Sec#:0, Addr:0x08001000, Size:0x0400, Caps:0x7 [REW]
  Region 0x05:  Zone:0, Sec#:0, Addr:0x08001400, Size:0x0400, Caps:0x7 [REW]
  Region 0x06:  Zone:0, Sec#:0, Addr:0x08001800, Size:0x0400, Caps:0x7 [REW]
  Region 0x07:  Zone:0, Sec#:0, Addr:0x08001c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x08:  Zone:0, Sec#:0, Addr:0x08002000, Size:0x0400, Caps:0x7 [REW]
  Region 0x09:  Zone:0, Sec#:0, Addr:0x08002400, Size:0x0400, Caps:0x7 [REW]
  Region 0x0a:  Zone:0, Sec#:0, Addr:0x08002800, Size:0x0400, Caps:0x7 [REW]
  Region 0x0b:  Zone:0, Sec#:0, Addr:0x08002c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x0c:  Zone:0, Sec#:0, Addr:0x08003000, Size:0x0400, Caps:0x7 [REW]
  Region 0x0d:  Zone:0, Sec#:0, Addr:0x08003400, Size:0x0400, Caps:0x7 [REW]
  Region 0x0e:  Zone:0, Sec#:0, Addr:0x08003800, Size:0x0400, Caps:0x7 [REW]
  Region 0x0f:  Zone:0, Sec#:0, Addr:0x08003c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x10:  Zone:0, Sec#:0, Addr:0x08004000, Size:0x0400, Caps:0x7 [REW]
  Region 0x11:  Zone:0, Sec#:0, Addr:0x08004400, Size:0x0400, Caps:0x7 [REW]
  Region 0x12:  Zone:0, Sec#:0, Addr:0x08004800, Size:0x0400, Caps:0x7 [REW]
  Region 0x13:  Zone:0, Sec#:0, Addr:0x08004c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x14:  Zone:0, Sec#:0, Addr:0x08005000, Size:0x0400, Caps:0x7 [REW]
  Region 0x15:  Zone:0, Sec#:0, Addr:0x08005400, Size:0x0400, Caps:0x7 [REW]
  Region 0x16:  Zone:0, Sec#:0, Addr:0x08005800, Size:0x0400, Caps:0x7 [REW]
  Region 0x17:  Zone:0, Sec#:0, Addr:0x08005c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x18:  Zone:0, Sec#:0, Addr:0x08006000, Size:0x0400, Caps:0x7 [REW]
  Region 0x19:  Zone:0, Sec#:0, Addr:0x08006400, Size:0x0400, Caps:0x7 [REW]
  Region 0x1a:  Zone:0, Sec#:0, Addr:0x08006800, Size:0x0400, Caps:0x7 [REW]
  Region 0x1b:  Zone:0, Sec#:0, Addr:0x08006c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x1c:  Zone:0, Sec#:0, Addr:0x08007000, Size:0x0400, Caps:0x7 [REW]
  Region 0x1d:  Zone:0, Sec#:0, Addr:0x08007400, Size:0x0400, Caps:0x7 [REW]
  Region 0x1e:  Zone:0, Sec#:0, Addr:0x08007800, Size:0x0400, Caps:0x7 [REW]
  Region 0x1f:  Zone:0, Sec#:0, Addr:0x08007c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x20:  Zone:0, Sec#:0, Addr:0x08008000, Size:0x0400, Caps:0x7 [REW]
  Region 0x21:  Zone:0, Sec#:0, Addr:0x08008400, Size:0x0400, Caps:0x7 [REW]
  Region 0x22:  Zone:0, Sec#:0, Addr:0x08008800, Size:0x0400, Caps:0x7 [REW]
  Region 0x23:  Zone:0, Sec#:0, Addr:0x08008c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x24:  Zone:0, Sec#:0, Addr:0x08009000, Size:0x0400, Caps:0x7 [REW]
  Region 0x25:  Zone:0, Sec#:0, Addr:0x08009400, Size:0x0400, Caps:0x7 [REW]
  Region 0x26:  Zone:0, Sec#:0, Addr:0x08009800, Size:0x0400, Caps:0x7 [REW]
  Region 0x27:  Zone:0, Sec#:0, Addr:0x08009c00, Size:0x0400, Caps:0x7 [REW]
  Region 0x28:  Zone:0, Sec#:0, Addr:0x0800a000, Size:0x0400, Caps:0x7 [REW]
  Region 0x29:  Zone:0, Sec#:0, Addr:0x0800a400, Size:0x0400, Caps:0x7 [REW]
  Region 0x2a:  Zone:0, Sec#:0, Addr:0x0800a800, Size:0x0400, Caps:0x7 [REW]
  Region 0x2b:  Zone:0, Sec#:0, Addr:0x0800ac00, Size:0x0400, Caps:0x7 [REW]
  Region 0x2c:  Zone:0, Sec#:0, Addr:0x0800b000, Size:0x0400, Caps:0x7 [REW]
  Region 0x2d:  Zone:0, Sec#:0, Addr:0x0800b400, Size:0x0400, Caps:0x7 [REW]
  Region 0x2e:  Zone:0, Sec#:0, Addr:0x0800b800, Size:0x0400, Caps:0x7 [REW]
  Region 0x2f:  Zone:0, Sec#:0, Addr:0x0800bc00, Size:0x0400, Caps:0x7 [REW]
  Region 0x30:  Zone:0, Sec#:0, Addr:0x0800c000, Size:0x0400, Caps:0x7 [REW]
  Region 0x31:  Zone:0, Sec#:0, Addr:0x0800c400, Size:0x0400, Caps:0x7 [REW]
  Region 0x32:  Zone:0, Sec#:1, Addr:0x0800c800, Size:0x0400, Caps:0x1 [R]
  Region 0x33:  Zone:0, Sec#:1, Addr:0x0800cc00, Size:0x0400, Caps:0x1 [R]
  Region 0x34:  Zone:0, Sec#:1, Addr:0x0800d000, Size:0x0400, Caps:0x1 [R]
  Region 0x35:  Zone:0, Sec#:1, Addr:0x0800d400, Size:0x0400, Caps:0x1 [R]
  Region 0x36:  Zone:0, Sec#:1, Addr:0x0800d800, Size:0x0400, Caps:0x1 [R]
  Region 0x37:  Zone:0, Sec#:1, Addr:0x0800dc00, Size:0x0400, Caps:0x1 [R]
  Region 0x38:  Zone:0, Sec#:1, Addr:0x0800e000, Size:0x0400, Caps:0x1 [R]
  Region 0x39:  Zone:0, Sec#:1, Addr:0x0800e400, Size:0x0400, Caps:0x1 [R]
  Region 0x3a:  Zone:0, Sec#:1, Addr:0x0800e800, Size:0x0400, Caps:0x1 [R]
  Region 0x3b:  Zone:0, Sec#:1, Addr:0x0800ec00, Size:0x0400, Caps:0x1 [R]
  Region 0x3c:  Zone:0, Sec#:1, Addr:0x0800f000, Size:0x0400, Caps:0x1 [R]
  Region 0x3d:  Zone:0, Sec#:1, Addr:0x0800f400, Size:0x0400, Caps:0x1 [R]
  Region 0x3e:  Zone:0, Sec#:1, Addr:0x0800f800, Size:0x0400, Caps:0x1 [R]
```

Todo
----

a) Current code is based on libopencm3 DFU example. The code currently occupies 14k at the end of flash. This needs to be reduced.

b) Although working, the code is far from complete.

c) To see how to support firmware that is offseted so that firmware built for other DFU bootloader can be uploaded unmodified using this bootloader.

d) To support STM32F1xx with 2k flash bank.


