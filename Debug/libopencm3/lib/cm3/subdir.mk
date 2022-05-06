################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/cm3/assert.c \
../libopencm3/lib/cm3/dwt.c \
../libopencm3/lib/cm3/nvic.c \
../libopencm3/lib/cm3/scb.c \
../libopencm3/lib/cm3/sync.c \
../libopencm3/lib/cm3/systick.c \
../libopencm3/lib/cm3/vector.c 

OBJS += \
./libopencm3/lib/cm3/assert.o \
./libopencm3/lib/cm3/dwt.o \
./libopencm3/lib/cm3/nvic.o \
./libopencm3/lib/cm3/scb.o \
./libopencm3/lib/cm3/sync.o \
./libopencm3/lib/cm3/systick.o \
./libopencm3/lib/cm3/vector.o 

C_DEPS += \
./libopencm3/lib/cm3/assert.d \
./libopencm3/lib/cm3/dwt.d \
./libopencm3/lib/cm3/nvic.d \
./libopencm3/lib/cm3/scb.d \
./libopencm3/lib/cm3/sync.d \
./libopencm3/lib/cm3/systick.d \
./libopencm3/lib/cm3/vector.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/cm3/%.o: ../libopencm3/lib/cm3/%.c libopencm3/lib/cm3/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g3 -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -Wa,-adhlns="$@.lst" -v -mpic-register=r9 -msingle-pic-base -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


