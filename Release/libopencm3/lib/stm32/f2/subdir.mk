################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/stm32/f2/crypto.c \
../libopencm3/lib/stm32/f2/flash.c \
../libopencm3/lib/stm32/f2/i2c.c \
../libopencm3/lib/stm32/f2/rcc.c \
../libopencm3/lib/stm32/f2/rng.c \
../libopencm3/lib/stm32/f2/vector_nvic.c 

O_SRCS += \
../libopencm3/lib/stm32/f2/crc_common_all.o \
../libopencm3/lib/stm32/f2/crypto_common_f24.o \
../libopencm3/lib/stm32/f2/dac_common_all.o \
../libopencm3/lib/stm32/f2/dac_common_v1.o \
../libopencm3/lib/stm32/f2/desig_common_all.o \
../libopencm3/lib/stm32/f2/desig_common_v1.o \
../libopencm3/lib/stm32/f2/dma_common_f24.o \
../libopencm3/lib/stm32/f2/exti_common_all.o \
../libopencm3/lib/stm32/f2/flash.o \
../libopencm3/lib/stm32/f2/flash_common_all.o \
../libopencm3/lib/stm32/f2/flash_common_f.o \
../libopencm3/lib/stm32/f2/flash_common_f24.o \
../libopencm3/lib/stm32/f2/flash_common_idcache.o \
../libopencm3/lib/stm32/f2/gpio_common_all.o \
../libopencm3/lib/stm32/f2/gpio_common_f0234.o \
../libopencm3/lib/stm32/f2/hash_common_f24.o \
../libopencm3/lib/stm32/f2/i2c_common_v1.o \
../libopencm3/lib/stm32/f2/iwdg_common_all.o \
../libopencm3/lib/stm32/f2/rcc.o \
../libopencm3/lib/stm32/f2/rcc_common_all.o \
../libopencm3/lib/stm32/f2/rng_common_v1.o \
../libopencm3/lib/stm32/f2/rtc_common_l1f024.o \
../libopencm3/lib/stm32/f2/spi_common_all.o \
../libopencm3/lib/stm32/f2/spi_common_v1.o \
../libopencm3/lib/stm32/f2/spi_common_v1_frf.o \
../libopencm3/lib/stm32/f2/timer_common_all.o \
../libopencm3/lib/stm32/f2/timer_common_f0234.o \
../libopencm3/lib/stm32/f2/timer_common_f24.o \
../libopencm3/lib/stm32/f2/usart_common_all.o \
../libopencm3/lib/stm32/f2/usart_common_f124.o \
../libopencm3/lib/stm32/f2/usb.o \
../libopencm3/lib/stm32/f2/usb_control.o \
../libopencm3/lib/stm32/f2/usb_standard.o 

OBJS += \
./libopencm3/lib/stm32/f2/crypto.o \
./libopencm3/lib/stm32/f2/flash.o \
./libopencm3/lib/stm32/f2/i2c.o \
./libopencm3/lib/stm32/f2/rcc.o \
./libopencm3/lib/stm32/f2/rng.o \
./libopencm3/lib/stm32/f2/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/stm32/f2/crypto.d \
./libopencm3/lib/stm32/f2/flash.d \
./libopencm3/lib/stm32/f2/i2c.d \
./libopencm3/lib/stm32/f2/rcc.d \
./libopencm3/lib/stm32/f2/rng.d \
./libopencm3/lib/stm32/f2/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/stm32/f2/%.o: ../libopencm3/lib/stm32/f2/%.c libopencm3/lib/stm32/f2/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


