################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/nrf/52/i2c.c \
../libopencm3/lib/nrf/52/vector_nvic.c 

OBJS += \
./libopencm3/lib/nrf/52/i2c.o \
./libopencm3/lib/nrf/52/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/nrf/52/i2c.d \
./libopencm3/lib/nrf/52/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/nrf/52/%.o: ../libopencm3/lib/nrf/52/%.c libopencm3/lib/nrf/52/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


