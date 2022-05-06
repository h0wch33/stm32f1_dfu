################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/efm32/common/acmp_common.c \
../libopencm3/lib/efm32/common/adc_common.c \
../libopencm3/lib/efm32/common/burtc_common.c \
../libopencm3/lib/efm32/common/cmu_common.c \
../libopencm3/lib/efm32/common/dac_common.c \
../libopencm3/lib/efm32/common/dma_common.c \
../libopencm3/lib/efm32/common/emu_common.c \
../libopencm3/lib/efm32/common/gpio_common.c \
../libopencm3/lib/efm32/common/i2c_common.c \
../libopencm3/lib/efm32/common/letimer_common.c \
../libopencm3/lib/efm32/common/msc_common.c \
../libopencm3/lib/efm32/common/prs_common.c \
../libopencm3/lib/efm32/common/rmu_common.c \
../libopencm3/lib/efm32/common/rtc_common.c \
../libopencm3/lib/efm32/common/timer_common.c \
../libopencm3/lib/efm32/common/usart_common.c \
../libopencm3/lib/efm32/common/wdog_common.c 

OBJS += \
./libopencm3/lib/efm32/common/acmp_common.o \
./libopencm3/lib/efm32/common/adc_common.o \
./libopencm3/lib/efm32/common/burtc_common.o \
./libopencm3/lib/efm32/common/cmu_common.o \
./libopencm3/lib/efm32/common/dac_common.o \
./libopencm3/lib/efm32/common/dma_common.o \
./libopencm3/lib/efm32/common/emu_common.o \
./libopencm3/lib/efm32/common/gpio_common.o \
./libopencm3/lib/efm32/common/i2c_common.o \
./libopencm3/lib/efm32/common/letimer_common.o \
./libopencm3/lib/efm32/common/msc_common.o \
./libopencm3/lib/efm32/common/prs_common.o \
./libopencm3/lib/efm32/common/rmu_common.o \
./libopencm3/lib/efm32/common/rtc_common.o \
./libopencm3/lib/efm32/common/timer_common.o \
./libopencm3/lib/efm32/common/usart_common.o \
./libopencm3/lib/efm32/common/wdog_common.o 

C_DEPS += \
./libopencm3/lib/efm32/common/acmp_common.d \
./libopencm3/lib/efm32/common/adc_common.d \
./libopencm3/lib/efm32/common/burtc_common.d \
./libopencm3/lib/efm32/common/cmu_common.d \
./libopencm3/lib/efm32/common/dac_common.d \
./libopencm3/lib/efm32/common/dma_common.d \
./libopencm3/lib/efm32/common/emu_common.d \
./libopencm3/lib/efm32/common/gpio_common.d \
./libopencm3/lib/efm32/common/i2c_common.d \
./libopencm3/lib/efm32/common/letimer_common.d \
./libopencm3/lib/efm32/common/msc_common.d \
./libopencm3/lib/efm32/common/prs_common.d \
./libopencm3/lib/efm32/common/rmu_common.d \
./libopencm3/lib/efm32/common/rtc_common.d \
./libopencm3/lib/efm32/common/timer_common.d \
./libopencm3/lib/efm32/common/usart_common.d \
./libopencm3/lib/efm32/common/wdog_common.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/efm32/common/%.o: ../libopencm3/lib/efm32/common/%.c libopencm3/lib/efm32/common/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


