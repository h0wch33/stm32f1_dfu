################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/stm32/common/adc_common_v1.c \
../libopencm3/lib/stm32/common/crc_common_all.c \
../libopencm3/lib/stm32/common/dac_common_all.c \
../libopencm3/lib/stm32/common/dac_common_v1.c \
../libopencm3/lib/stm32/common/desig_common_all.c \
../libopencm3/lib/stm32/common/desig_common_v1.c \
../libopencm3/lib/stm32/common/dma_common_l1f013.c \
../libopencm3/lib/stm32/common/exti_common_all.c \
../libopencm3/lib/stm32/common/flash_common_all.c \
../libopencm3/lib/stm32/common/flash_common_f.c \
../libopencm3/lib/stm32/common/flash_common_f01.c \
../libopencm3/lib/stm32/common/flash_common_idcache.c \
../libopencm3/lib/stm32/common/gpio_common_all.c \
../libopencm3/lib/stm32/common/i2c_common_v1.c \
../libopencm3/lib/stm32/common/iwdg_common_all.c \
../libopencm3/lib/stm32/common/pwr_common_v1.c \
../libopencm3/lib/stm32/common/rcc_common_all.c \
../libopencm3/lib/stm32/common/spi_common_all.c \
../libopencm3/lib/stm32/common/spi_common_v1.c \
../libopencm3/lib/stm32/common/st_usbfs_core.c \
../libopencm3/lib/stm32/common/timer_common_all.c \
../libopencm3/lib/stm32/common/usart_common_all.c 

OBJS += \
./libopencm3/lib/stm32/common/adc_common_v1.o \
./libopencm3/lib/stm32/common/crc_common_all.o \
./libopencm3/lib/stm32/common/dac_common_all.o \
./libopencm3/lib/stm32/common/dac_common_v1.o \
./libopencm3/lib/stm32/common/desig_common_all.o \
./libopencm3/lib/stm32/common/desig_common_v1.o \
./libopencm3/lib/stm32/common/dma_common_l1f013.o \
./libopencm3/lib/stm32/common/exti_common_all.o \
./libopencm3/lib/stm32/common/flash_common_all.o \
./libopencm3/lib/stm32/common/flash_common_f.o \
./libopencm3/lib/stm32/common/flash_common_f01.o \
./libopencm3/lib/stm32/common/flash_common_idcache.o \
./libopencm3/lib/stm32/common/gpio_common_all.o \
./libopencm3/lib/stm32/common/i2c_common_v1.o \
./libopencm3/lib/stm32/common/iwdg_common_all.o \
./libopencm3/lib/stm32/common/pwr_common_v1.o \
./libopencm3/lib/stm32/common/rcc_common_all.o \
./libopencm3/lib/stm32/common/spi_common_all.o \
./libopencm3/lib/stm32/common/spi_common_v1.o \
./libopencm3/lib/stm32/common/st_usbfs_core.o \
./libopencm3/lib/stm32/common/timer_common_all.o \
./libopencm3/lib/stm32/common/usart_common_all.o 

C_DEPS += \
./libopencm3/lib/stm32/common/adc_common_v1.d \
./libopencm3/lib/stm32/common/crc_common_all.d \
./libopencm3/lib/stm32/common/dac_common_all.d \
./libopencm3/lib/stm32/common/dac_common_v1.d \
./libopencm3/lib/stm32/common/desig_common_all.d \
./libopencm3/lib/stm32/common/desig_common_v1.d \
./libopencm3/lib/stm32/common/dma_common_l1f013.d \
./libopencm3/lib/stm32/common/exti_common_all.d \
./libopencm3/lib/stm32/common/flash_common_all.d \
./libopencm3/lib/stm32/common/flash_common_f.d \
./libopencm3/lib/stm32/common/flash_common_f01.d \
./libopencm3/lib/stm32/common/flash_common_idcache.d \
./libopencm3/lib/stm32/common/gpio_common_all.d \
./libopencm3/lib/stm32/common/i2c_common_v1.d \
./libopencm3/lib/stm32/common/iwdg_common_all.d \
./libopencm3/lib/stm32/common/pwr_common_v1.d \
./libopencm3/lib/stm32/common/rcc_common_all.d \
./libopencm3/lib/stm32/common/spi_common_all.d \
./libopencm3/lib/stm32/common/spi_common_v1.d \
./libopencm3/lib/stm32/common/st_usbfs_core.d \
./libopencm3/lib/stm32/common/timer_common_all.d \
./libopencm3/lib/stm32/common/usart_common_all.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/stm32/common/%.o: ../libopencm3/lib/stm32/common/%.c libopencm3/lib/stm32/common/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g3 -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -Wa,-adhlns="$@.lst" -v -mpic-register=r9 -msingle-pic-base -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


