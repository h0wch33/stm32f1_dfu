################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/sam/4l/adcife.c \
../libopencm3/lib/sam/4l/gpio.c \
../libopencm3/lib/sam/4l/pm.c \
../libopencm3/lib/sam/4l/scif.c \
../libopencm3/lib/sam/4l/usart.c \
../libopencm3/lib/sam/4l/vector_nvic.c 

OBJS += \
./libopencm3/lib/sam/4l/adcife.o \
./libopencm3/lib/sam/4l/gpio.o \
./libopencm3/lib/sam/4l/pm.o \
./libopencm3/lib/sam/4l/scif.o \
./libopencm3/lib/sam/4l/usart.o \
./libopencm3/lib/sam/4l/vector_nvic.o 

C_DEPS += \
./libopencm3/lib/sam/4l/adcife.d \
./libopencm3/lib/sam/4l/gpio.d \
./libopencm3/lib/sam/4l/pm.d \
./libopencm3/lib/sam/4l/scif.d \
./libopencm3/lib/sam/4l/usart.d \
./libopencm3/lib/sam/4l/vector_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/sam/4l/%.o: ../libopencm3/lib/sam/4l/%.c libopencm3/lib/sam/4l/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


