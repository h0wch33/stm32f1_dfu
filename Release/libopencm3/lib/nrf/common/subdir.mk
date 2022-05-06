################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/nrf/common/clock_common.c \
../libopencm3/lib/nrf/common/gpio.c \
../libopencm3/lib/nrf/common/i2c_common.c \
../libopencm3/lib/nrf/common/ppi.c \
../libopencm3/lib/nrf/common/radio_common.c \
../libopencm3/lib/nrf/common/rtc.c \
../libopencm3/lib/nrf/common/timer.c \
../libopencm3/lib/nrf/common/uart.c 

OBJS += \
./libopencm3/lib/nrf/common/clock_common.o \
./libopencm3/lib/nrf/common/gpio.o \
./libopencm3/lib/nrf/common/i2c_common.o \
./libopencm3/lib/nrf/common/ppi.o \
./libopencm3/lib/nrf/common/radio_common.o \
./libopencm3/lib/nrf/common/rtc.o \
./libopencm3/lib/nrf/common/timer.o \
./libopencm3/lib/nrf/common/uart.o 

C_DEPS += \
./libopencm3/lib/nrf/common/clock_common.d \
./libopencm3/lib/nrf/common/gpio.d \
./libopencm3/lib/nrf/common/i2c_common.d \
./libopencm3/lib/nrf/common/ppi.d \
./libopencm3/lib/nrf/common/radio_common.d \
./libopencm3/lib/nrf/common/rtc.d \
./libopencm3/lib/nrf/common/timer.d \
./libopencm3/lib/nrf/common/uart.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/nrf/common/%.o: ../libopencm3/lib/nrf/common/%.c libopencm3/lib/nrf/common/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


