################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/dispatch/vector_chipset.c 

OBJS += \
./libopencm3/lib/dispatch/vector_chipset.o 

C_DEPS += \
./libopencm3/lib/dispatch/vector_chipset.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/dispatch/%.o: ../libopencm3/lib/dispatch/%.c libopencm3/lib/dispatch/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g3 -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -Wa,-adhlns="$@.lst" -v -mpic-register=r9 -msingle-pic-base -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


