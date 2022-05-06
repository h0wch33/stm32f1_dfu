################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/lpc13xx/gpio.c \
../libopencm3/lib/lpc13xx/vector_nvic.c 

OBJS += \
./libopencm3/lib/lpc13xx/gpio.o \
./libopencm3/lib/lpc13xx/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/lpc13xx/gpio.d \
./libopencm3/lib/lpc13xx/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/lpc13xx/%.o: ../libopencm3/lib/lpc13xx/%.c libopencm3/lib/lpc13xx/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


