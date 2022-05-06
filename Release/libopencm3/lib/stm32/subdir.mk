################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/stm32/can.c \
../libopencm3/lib/stm32/st_usbfs_v1.c \
../libopencm3/lib/stm32/st_usbfs_v2.c 

OBJS += \
./libopencm3/lib/stm32/can.o \
./libopencm3/lib/stm32/st_usbfs_v1.o \
./libopencm3/lib/stm32/st_usbfs_v2.o 

C_DEPS += \
./libopencm3/lib/stm32/can.d \
./libopencm3/lib/stm32/st_usbfs_v1.d \
./libopencm3/lib/stm32/st_usbfs_v2.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/stm32/%.o: ../libopencm3/lib/stm32/%.c libopencm3/lib/stm32/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


