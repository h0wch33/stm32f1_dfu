################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libopencm3/lib/usb/usb.c \
../libopencm3/lib/usb/usb_audio.c \
../libopencm3/lib/usb/usb_cdc.c \
../libopencm3/lib/usb/usb_control.c \
../libopencm3/lib/usb/usb_dwc_common.c \
../libopencm3/lib/usb/usb_efm32hg.c \
../libopencm3/lib/usb/usb_f107.c \
../libopencm3/lib/usb/usb_f207.c \
../libopencm3/lib/usb/usb_hid.c \
../libopencm3/lib/usb/usb_lm4f.c \
../libopencm3/lib/usb/usb_midi.c \
../libopencm3/lib/usb/usb_msc.c \
../libopencm3/lib/usb/usb_standard.c 

OBJS += \
./libopencm3/lib/usb/usb.o \
./libopencm3/lib/usb/usb_audio.o \
./libopencm3/lib/usb/usb_cdc.o \
./libopencm3/lib/usb/usb_control.o \
./libopencm3/lib/usb/usb_dwc_common.o \
./libopencm3/lib/usb/usb_efm32hg.o \
./libopencm3/lib/usb/usb_f107.o \
./libopencm3/lib/usb/usb_f207.o \
./libopencm3/lib/usb/usb_hid.o \
./libopencm3/lib/usb/usb_lm4f.o \
./libopencm3/lib/usb/usb_midi.o \
./libopencm3/lib/usb/usb_msc.o \
./libopencm3/lib/usb/usb_standard.o 

C_DEPS += \
./libopencm3/lib/usb/usb.d \
./libopencm3/lib/usb/usb_audio.d \
./libopencm3/lib/usb/usb_cdc.d \
./libopencm3/lib/usb/usb_control.d \
./libopencm3/lib/usb/usb_dwc_common.d \
./libopencm3/lib/usb/usb_efm32hg.d \
./libopencm3/lib/usb/usb_f107.d \
./libopencm3/lib/usb/usb_f207.d \
./libopencm3/lib/usb/usb_hid.d \
./libopencm3/lib/usb/usb_lm4f.d \
./libopencm3/lib/usb/usb_midi.d \
./libopencm3/lib/usb/usb_msc.d \
./libopencm3/lib/usb/usb_standard.d 


# Each subdirectory must supply rules for building sources it contributes
libopencm3/lib/usb/%.o: ../libopencm3/lib/usb/%.c libopencm3/lib/usb/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -DSTM32F1 -I/home/src/eclipse-workspace/stm32f1_dfu/libopencm3/include -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


