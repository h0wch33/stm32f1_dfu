################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/tests/shared/trace.c \
../libopencm3/tests/shared/trace_stdio.c 

OBJS += \
./libopencm3/tests/shared/trace.o \
./libopencm3/tests/shared/trace_stdio.o 

C_DEPS += \
./libopencm3/tests/shared/trace.d \
./libopencm3/tests/shared/trace_stdio.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/tests/shared/%.o: ../libopencm3/tests/shared/%.c libopencm3/tests/shared/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


