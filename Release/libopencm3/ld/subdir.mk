################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../libopencm3/ld/linker.ld.S 

OBJS += \
./libopencm3/ld/linker.ld.o 

S_UPPER_DEPS += \
./libopencm3/ld/linker.ld.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/ld/%.o: ../libopencm3/ld/%.S libopencm3/ld/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


