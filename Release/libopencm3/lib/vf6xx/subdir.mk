################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/vf6xx/ccm.c \
../libopencm3/lib/vf6xx/gpio.c \
../libopencm3/lib/vf6xx/iomuxc.c \
../libopencm3/lib/vf6xx/uart.c \
../libopencm3/lib/vf6xx/vector_chipset.c \
../libopencm3/lib/vf6xx/vector_nvic.c 

OBJS += \
./libopencm3/lib/vf6xx/ccm.o \
./libopencm3/lib/vf6xx/gpio.o \
./libopencm3/lib/vf6xx/iomuxc.o \
./libopencm3/lib/vf6xx/uart.o \
./libopencm3/lib/vf6xx/vector_chipset.o \
./libopencm3/lib/vf6xx/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/vf6xx/ccm.d \
./libopencm3/lib/vf6xx/gpio.d \
./libopencm3/lib/vf6xx/iomuxc.d \
./libopencm3/lib/vf6xx/uart.d \
./libopencm3/lib/vf6xx/vector_chipset.d \
./libopencm3/lib/vf6xx/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/vf6xx/%.o: ../libopencm3/lib/vf6xx/%.c libopencm3/lib/vf6xx/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


