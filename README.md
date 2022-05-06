# stm32f1_dfu

Another DFU for STM32F103C8T6 module
------------------------------------

Most non built-in DFU bootloader available today requires the firmware that is to be uploaded to the MCU to be offseted from the orgiin of FLASH memory base address. The offset is needed since the DFU bootloader is placed at the beginning of flash memory. Different DFU bootloader has different offset requirement and hence the firmware that is going to be uploaded needs to be recompile for different bootloader. 

This bootloader on the other hand will moved itself to end of flash so that existing firmware can be uploaded as it is without offseting from the beginning of flash.

The setback is that this bootloader will change the content of the vector table of the uploaded firmware. It replaces the intial stack pointer and the reset address of the uploaded firmware with its own pointer. The original stack pointer and reset address of the uploaded firmware is placed at offset 0x1C and 0x20. (address 0x800001c and 0x8000020 respectively). The 4 byte value at these address must be 0 in order for this bootloader to use it. By default, these address is unused and usually contains zeros.

After uploading the firmware, user can unplug and plug in again the STM32F103C8 module to run the uploaded firmware.

To go into DFU bootloader, press the reset button.

This DFU loader also can upgrade itself when a new version is avaialble.

The codes still is incomplete but is enough for dfu-util to load required firmware.

Building the DFU firmware image
-------------------------------

$ git clone --recursive https://github.com/h0wch33/stm32f1_dfu.git
$ cd stm32f1_dfu
$ make -C libopencm3 TARGETS='stm32/f1'
$ make -C Debug all

Flashing the DFU firmware to MCU
--------------------------------

To flash it first time into the MCU (change the script files path as appropriate)

$ openocd -f /usr/local/share/openocd/scripts/interface/stlink.cfg \
$ -f /usr/local/share/openocd/scripts/target/stm32f1x.cfg \
$ -c "program stm32f1_dfu.bin verify reset exit 0x8000000"


Using the DFU bootloader
------------------------

Press the reset button on the STM32F103C8T6 module and use dfu-util to upload the required firmware

e.g.

$ dfu-util -s 0x8000000 -D stm103v2.bin -R

In Linux, option -R will do a USB port reset and the DFU firmware will run the uploaded firmware straight away after flashing.


Todo
----

a) Current code is based on libopencm3 DFU example. The code currently occupies 14k at the end of flash. This needed to be reduced.

b) Although working, the code is far from complete.

c) To see how to support firmware that is offseted so that firmware built for other DFU bootloader can be uploaded unmodified using this bootloader.




