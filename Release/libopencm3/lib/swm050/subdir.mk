################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/swm050/clk.c \
../libopencm3/lib/swm050/flash.c \
../libopencm3/lib/swm050/gpio.c \
../libopencm3/lib/swm050/pwr.c \
../libopencm3/lib/swm050/syscon.c \
../libopencm3/lib/swm050/timer.c \
../libopencm3/lib/swm050/vector_nvic.c \
../libopencm3/lib/swm050/wdt.c 

OBJS += \
./libopencm3/lib/swm050/clk.o \
./libopencm3/lib/swm050/flash.o \
./libopencm3/lib/swm050/gpio.o \
./libopencm3/lib/swm050/pwr.o \
./libopencm3/lib/swm050/syscon.o \
./libopencm3/lib/swm050/timer.o \
./libopencm3/lib/swm050/vector_nvic.o \
./libopencm3/lib/swm050/wdt.o 

C_DEPS += \
./libopencm3/lib/swm050/clk.d \
./libopencm3/lib/swm050/flash.d \
./libopencm3/lib/swm050/gpio.d \
./libopencm3/lib/swm050/pwr.d \
./libopencm3/lib/swm050/syscon.d \
./libopencm3/lib/swm050/timer.d \
./libopencm3/lib/swm050/vector_nvic.d \
./libopencm3/lib/swm050/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/swm050/%.o: ../libopencm3/lib/swm050/%.c libopencm3/lib/swm050/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


