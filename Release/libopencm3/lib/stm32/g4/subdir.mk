################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/stm32/g4/adc.c \
../libopencm3/lib/stm32/g4/fdcan.c \
../libopencm3/lib/stm32/g4/flash.c \
../libopencm3/lib/stm32/g4/pwr.c \
../libopencm3/lib/stm32/g4/rcc.c \
../libopencm3/lib/stm32/g4/vector_chipset.c \
../libopencm3/lib/stm32/g4/vector_nvic.c 

OBJS += \
./libopencm3/lib/stm32/g4/adc.o \
./libopencm3/lib/stm32/g4/fdcan.o \
./libopencm3/lib/stm32/g4/flash.o \
./libopencm3/lib/stm32/g4/pwr.o \
./libopencm3/lib/stm32/g4/rcc.o \
./libopencm3/lib/stm32/g4/vector_chipset.o \
./libopencm3/lib/stm32/g4/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/stm32/g4/adc.d \
./libopencm3/lib/stm32/g4/fdcan.d \
./libopencm3/lib/stm32/g4/flash.d \
./libopencm3/lib/stm32/g4/pwr.d \
./libopencm3/lib/stm32/g4/rcc.d \
./libopencm3/lib/stm32/g4/vector_chipset.d \
./libopencm3/lib/stm32/g4/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/stm32/g4/%.o: ../libopencm3/lib/stm32/g4/%.c libopencm3/lib/stm32/g4/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


