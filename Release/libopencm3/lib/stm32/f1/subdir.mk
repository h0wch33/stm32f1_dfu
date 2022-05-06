################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/stm32/f1/adc.c \
../libopencm3/lib/stm32/f1/flash.c \
../libopencm3/lib/stm32/f1/gpio.c \
../libopencm3/lib/stm32/f1/i2c.c \
../libopencm3/lib/stm32/f1/rcc.c \
../libopencm3/lib/stm32/f1/rtc.c \
../libopencm3/lib/stm32/f1/timer.c \
../libopencm3/lib/stm32/f1/vector_nvic.c 

O_SRCS += \
../libopencm3/lib/stm32/f1/adc.o \
../libopencm3/lib/stm32/f1/adc_common_v1.o \
../libopencm3/lib/stm32/f1/assert.o \
../libopencm3/lib/stm32/f1/can.o \
../libopencm3/lib/stm32/f1/crc_common_all.o \
../libopencm3/lib/stm32/f1/dac_common_all.o \
../libopencm3/lib/stm32/f1/dac_common_v1.o \
../libopencm3/lib/stm32/f1/desig_common_all.o \
../libopencm3/lib/stm32/f1/desig_common_v1.o \
../libopencm3/lib/stm32/f1/dma_common_l1f013.o \
../libopencm3/lib/stm32/f1/dwt.o \
../libopencm3/lib/stm32/f1/exti_common_all.o \
../libopencm3/lib/stm32/f1/flash.o \
../libopencm3/lib/stm32/f1/flash_common_all.o \
../libopencm3/lib/stm32/f1/flash_common_f.o \
../libopencm3/lib/stm32/f1/flash_common_f01.o \
../libopencm3/lib/stm32/f1/gpio.o \
../libopencm3/lib/stm32/f1/gpio_common_all.o \
../libopencm3/lib/stm32/f1/i2c_common_v1.o \
../libopencm3/lib/stm32/f1/iwdg_common_all.o \
../libopencm3/lib/stm32/f1/mac.o \
../libopencm3/lib/stm32/f1/mac_stm32fxx7.o \
../libopencm3/lib/stm32/f1/nvic.o \
../libopencm3/lib/stm32/f1/phy.o \
../libopencm3/lib/stm32/f1/phy_ksz80x1.o \
../libopencm3/lib/stm32/f1/pwr_common_v1.o \
../libopencm3/lib/stm32/f1/rcc.o \
../libopencm3/lib/stm32/f1/rcc_common_all.o \
../libopencm3/lib/stm32/f1/rtc.o \
../libopencm3/lib/stm32/f1/scb.o \
../libopencm3/lib/stm32/f1/spi_common_all.o \
../libopencm3/lib/stm32/f1/spi_common_v1.o \
../libopencm3/lib/stm32/f1/st_usbfs_core.o \
../libopencm3/lib/stm32/f1/st_usbfs_v1.o \
../libopencm3/lib/stm32/f1/sync.o \
../libopencm3/lib/stm32/f1/systick.o \
../libopencm3/lib/stm32/f1/timer.o \
../libopencm3/lib/stm32/f1/timer_common_all.o \
../libopencm3/lib/stm32/f1/usart_common_all.o \
../libopencm3/lib/stm32/f1/usart_common_f124.o \
../libopencm3/lib/stm32/f1/usb.o \
../libopencm3/lib/stm32/f1/usb_audio.o \
../libopencm3/lib/stm32/f1/usb_cdc.o \
../libopencm3/lib/stm32/f1/usb_control.o \
../libopencm3/lib/stm32/f1/usb_dwc_common.o \
../libopencm3/lib/stm32/f1/usb_f107.o \
../libopencm3/lib/stm32/f1/usb_hid.o \
../libopencm3/lib/stm32/f1/usb_midi.o \
../libopencm3/lib/stm32/f1/usb_msc.o \
../libopencm3/lib/stm32/f1/usb_standard.o \
../libopencm3/lib/stm32/f1/vector.o 

OBJS += \
./libopencm3/lib/stm32/f1/adc.o \
./libopencm3/lib/stm32/f1/flash.o \
./libopencm3/lib/stm32/f1/gpio.o \
./libopencm3/lib/stm32/f1/i2c.o \
./libopencm3/lib/stm32/f1/rcc.o \
./libopencm3/lib/stm32/f1/rtc.o \
./libopencm3/lib/stm32/f1/timer.o \
./libopencm3/lib/stm32/f1/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/stm32/f1/adc.d \
./libopencm3/lib/stm32/f1/flash.d \
./libopencm3/lib/stm32/f1/gpio.d \
./libopencm3/lib/stm32/f1/i2c.d \
./libopencm3/lib/stm32/f1/rcc.d \
./libopencm3/lib/stm32/f1/rtc.d \
./libopencm3/lib/stm32/f1/timer.d \
./libopencm3/lib/stm32/f1/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/stm32/f1/%.o: ../libopencm3/lib/stm32/f1/%.c libopencm3/lib/stm32/f1/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


