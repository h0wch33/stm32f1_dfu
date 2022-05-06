################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/ethernet/mac.c \
../libopencm3/lib/ethernet/mac_stm32fxx7.c \
../libopencm3/lib/ethernet/phy.c \
../libopencm3/lib/ethernet/phy_ksz80x1.c 

OBJS += \
./libopencm3/lib/ethernet/mac.o \
./libopencm3/lib/ethernet/mac_stm32fxx7.o \
./libopencm3/lib/ethernet/phy.o \
./libopencm3/lib/ethernet/phy_ksz80x1.o 

C_DEPS += \
./libopencm3/lib/ethernet/mac.d \
./libopencm3/lib/ethernet/mac_stm32fxx7.d \
./libopencm3/lib/ethernet/phy.d \
./libopencm3/lib/ethernet/phy_ksz80x1.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/ethernet/%.o: ../libopencm3/lib/ethernet/%.c libopencm3/lib/ethernet/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


