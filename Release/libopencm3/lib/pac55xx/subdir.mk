################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/pac55xx/can.c \
../libopencm3/lib/pac55xx/ccs.c \
../libopencm3/lib/pac55xx/gpio.c \
../libopencm3/lib/pac55xx/memctl.c \
../libopencm3/lib/pac55xx/usart.c \
../libopencm3/lib/pac55xx/vector_chipset.c \
../libopencm3/lib/pac55xx/vector_nvic.c 

OBJS += \
./libopencm3/lib/pac55xx/can.o \
./libopencm3/lib/pac55xx/ccs.o \
./libopencm3/lib/pac55xx/gpio.o \
./libopencm3/lib/pac55xx/memctl.o \
./libopencm3/lib/pac55xx/usart.o \
./libopencm3/lib/pac55xx/vector_chipset.o \
./libopencm3/lib/pac55xx/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/pac55xx/can.d \
./libopencm3/lib/pac55xx/ccs.d \
./libopencm3/lib/pac55xx/gpio.d \
./libopencm3/lib/pac55xx/memctl.d \
./libopencm3/lib/pac55xx/usart.d \
./libopencm3/lib/pac55xx/vector_chipset.d \
./libopencm3/lib/pac55xx/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/pac55xx/%.o: ../libopencm3/lib/pac55xx/%.c libopencm3/lib/pac55xx/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


