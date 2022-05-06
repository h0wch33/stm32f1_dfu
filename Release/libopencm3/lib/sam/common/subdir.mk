################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/sam/common/gpio_common_3a3u3x.c \
../libopencm3/lib/sam/common/gpio_common_3n3s.c \
../libopencm3/lib/sam/common/gpio_common_all.c \
../libopencm3/lib/sam/common/pmc.c \
../libopencm3/lib/sam/common/usart_common_3.c \
../libopencm3/lib/sam/common/usart_common_all.c 

OBJS += \
./libopencm3/lib/sam/common/gpio_common_3a3u3x.o \
./libopencm3/lib/sam/common/gpio_common_3n3s.o \
./libopencm3/lib/sam/common/gpio_common_all.o \
./libopencm3/lib/sam/common/pmc.o \
./libopencm3/lib/sam/common/usart_common_3.o \
./libopencm3/lib/sam/common/usart_common_all.o 

C_DEPS += \
./libopencm3/lib/sam/common/gpio_common_3a3u3x.d \
./libopencm3/lib/sam/common/gpio_common_3n3s.d \
./libopencm3/lib/sam/common/gpio_common_all.d \
./libopencm3/lib/sam/common/pmc.d \
./libopencm3/lib/sam/common/usart_common_3.d \
./libopencm3/lib/sam/common/usart_common_all.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/sam/common/%.o: ../libopencm3/lib/sam/common/%.c libopencm3/lib/sam/common/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


