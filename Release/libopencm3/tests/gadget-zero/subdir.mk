################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/tests/gadget-zero/delay.c \
../libopencm3/tests/gadget-zero/delay_efm32.c \
../libopencm3/tests/gadget-zero/main-efm32hg309-generic.c \
../libopencm3/tests/gadget-zero/main-stm32f072disco.c \
../libopencm3/tests/gadget-zero/main-stm32f103-generic.c \
../libopencm3/tests/gadget-zero/main-stm32f3-disco.c \
../libopencm3/tests/gadget-zero/main-stm32f429i-disco.c \
../libopencm3/tests/gadget-zero/main-stm32f4disco.c \
../libopencm3/tests/gadget-zero/main-stm32l053disco.c \
../libopencm3/tests/gadget-zero/main-stm32l1-generic.c \
../libopencm3/tests/gadget-zero/main-tilm4f120xl.c \
../libopencm3/tests/gadget-zero/usb-gadget0.c 

OBJS += \
./libopencm3/tests/gadget-zero/delay.o \
./libopencm3/tests/gadget-zero/delay_efm32.o \
./libopencm3/tests/gadget-zero/main-efm32hg309-generic.o \
./libopencm3/tests/gadget-zero/main-stm32f072disco.o \
./libopencm3/tests/gadget-zero/main-stm32f103-generic.o \
./libopencm3/tests/gadget-zero/main-stm32f3-disco.o \
./libopencm3/tests/gadget-zero/main-stm32f429i-disco.o \
./libopencm3/tests/gadget-zero/main-stm32f4disco.o \
./libopencm3/tests/gadget-zero/main-stm32l053disco.o \
./libopencm3/tests/gadget-zero/main-stm32l1-generic.o \
./libopencm3/tests/gadget-zero/main-tilm4f120xl.o \
./libopencm3/tests/gadget-zero/usb-gadget0.o 

C_DEPS += \
./libopencm3/tests/gadget-zero/delay.d \
./libopencm3/tests/gadget-zero/delay_efm32.d \
./libopencm3/tests/gadget-zero/main-efm32hg309-generic.d \
./libopencm3/tests/gadget-zero/main-stm32f072disco.d \
./libopencm3/tests/gadget-zero/main-stm32f103-generic.d \
./libopencm3/tests/gadget-zero/main-stm32f3-disco.d \
./libopencm3/tests/gadget-zero/main-stm32f429i-disco.d \
./libopencm3/tests/gadget-zero/main-stm32f4disco.d \
./libopencm3/tests/gadget-zero/main-stm32l053disco.d \
./libopencm3/tests/gadget-zero/main-stm32l1-generic.d \
./libopencm3/tests/gadget-zero/main-tilm4f120xl.d \
./libopencm3/tests/gadget-zero/usb-gadget0.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/tests/gadget-zero/%.o: ../libopencm3/tests/gadget-zero/%.c libopencm3/tests/gadget-zero/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


