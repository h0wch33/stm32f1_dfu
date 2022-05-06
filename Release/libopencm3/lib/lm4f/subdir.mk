################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/lm4f/gpio.c \
../libopencm3/lib/lm4f/rcc.c \
../libopencm3/lib/lm4f/systemcontrol.c \
../libopencm3/lib/lm4f/uart.c \
../libopencm3/lib/lm4f/vector_chipset.c 

OBJS += \
./libopencm3/lib/lm4f/gpio.o \
./libopencm3/lib/lm4f/rcc.o \
./libopencm3/lib/lm4f/systemcontrol.o \
./libopencm3/lib/lm4f/uart.o \
./libopencm3/lib/lm4f/vector_chipset.o 

C_DEPS += \
./libopencm3/lib/lm4f/gpio.d \
./libopencm3/lib/lm4f/rcc.d \
./libopencm3/lib/lm4f/systemcontrol.d \
./libopencm3/lib/lm4f/uart.d \
./libopencm3/lib/lm4f/vector_chipset.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/lm4f/%.o: ../libopencm3/lib/lm4f/%.c libopencm3/lib/lm4f/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


