################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/stm32/f0/adc.c \
../libopencm3/lib/stm32/f0/comparator.c \
../libopencm3/lib/stm32/f0/flash.c \
../libopencm3/lib/stm32/f0/i2c.c \
../libopencm3/lib/stm32/f0/rcc.c \
../libopencm3/lib/stm32/f0/syscfg.c \
../libopencm3/lib/stm32/f0/vector_nvic.c 

O_SRCS += \
../libopencm3/lib/stm32/f0/adc.o \
../libopencm3/lib/stm32/f0/adc_common_v2.o \
../libopencm3/lib/stm32/f0/assert.o \
../libopencm3/lib/stm32/f0/can.o \
../libopencm3/lib/stm32/f0/comparator.o \
../libopencm3/lib/stm32/f0/crc_common_all.o \
../libopencm3/lib/stm32/f0/crc_v2.o \
../libopencm3/lib/stm32/f0/crs_common_all.o \
../libopencm3/lib/stm32/f0/dac_common_all.o \
../libopencm3/lib/stm32/f0/dac_common_v1.o \
../libopencm3/lib/stm32/f0/desig_common_all.o \
../libopencm3/lib/stm32/f0/desig_common_v1.o \
../libopencm3/lib/stm32/f0/dma_common_csel.o \
../libopencm3/lib/stm32/f0/dma_common_l1f013.o \
../libopencm3/lib/stm32/f0/dwt.o \
../libopencm3/lib/stm32/f0/exti_common_all.o \
../libopencm3/lib/stm32/f0/flash.o \
../libopencm3/lib/stm32/f0/flash_common_all.o \
../libopencm3/lib/stm32/f0/flash_common_f.o \
../libopencm3/lib/stm32/f0/flash_common_f01.o \
../libopencm3/lib/stm32/f0/gpio_common_all.o \
../libopencm3/lib/stm32/f0/gpio_common_f0234.o \
../libopencm3/lib/stm32/f0/i2c_common_v2.o \
../libopencm3/lib/stm32/f0/iwdg_common_all.o \
../libopencm3/lib/stm32/f0/nvic.o \
../libopencm3/lib/stm32/f0/pwr_common_v1.o \
../libopencm3/lib/stm32/f0/rcc.o \
../libopencm3/lib/stm32/f0/rcc_common_all.o \
../libopencm3/lib/stm32/f0/rtc_common_l1f024.o \
../libopencm3/lib/stm32/f0/scb.o \
../libopencm3/lib/stm32/f0/spi_common_all.o \
../libopencm3/lib/stm32/f0/spi_common_v2.o \
../libopencm3/lib/stm32/f0/st_usbfs_core.o \
../libopencm3/lib/stm32/f0/st_usbfs_v2.o \
../libopencm3/lib/stm32/f0/sync.o \
../libopencm3/lib/stm32/f0/systick.o \
../libopencm3/lib/stm32/f0/timer_common_all.o \
../libopencm3/lib/stm32/f0/timer_common_f0234.o \
../libopencm3/lib/stm32/f0/usart_common_all.o \
../libopencm3/lib/stm32/f0/usart_common_v2.o \
../libopencm3/lib/stm32/f0/usb.o \
../libopencm3/lib/stm32/f0/usb_audio.o \
../libopencm3/lib/stm32/f0/usb_cdc.o \
../libopencm3/lib/stm32/f0/usb_control.o \
../libopencm3/lib/stm32/f0/usb_hid.o \
../libopencm3/lib/stm32/f0/usb_midi.o \
../libopencm3/lib/stm32/f0/usb_msc.o \
../libopencm3/lib/stm32/f0/usb_standard.o \
../libopencm3/lib/stm32/f0/vector.o 

OBJS += \
./libopencm3/lib/stm32/f0/adc.o \
./libopencm3/lib/stm32/f0/comparator.o \
./libopencm3/lib/stm32/f0/flash.o \
./libopencm3/lib/stm32/f0/i2c.o \
./libopencm3/lib/stm32/f0/rcc.o \
./libopencm3/lib/stm32/f0/syscfg.o \
./libopencm3/lib/stm32/f0/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/stm32/f0/adc.d \
./libopencm3/lib/stm32/f0/comparator.d \
./libopencm3/lib/stm32/f0/flash.d \
./libopencm3/lib/stm32/f0/i2c.d \
./libopencm3/lib/stm32/f0/rcc.d \
./libopencm3/lib/stm32/f0/syscfg.d \
./libopencm3/lib/stm32/f0/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/stm32/f0/%.o: ../libopencm3/lib/stm32/f0/%.c libopencm3/lib/stm32/f0/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


