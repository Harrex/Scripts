#!/bin/bash
a=$(xinput list-props "Apple SPI Touchpad" | grep "Device Enabled")
b=${a:0-1}

echo $b
if [ $b -eq 0 ]
then
    xinput enable "Apple SPI Touchpad"
else
    xinput disable "Apple SPI Touchpad"
fi
