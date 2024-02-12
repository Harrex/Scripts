#!/bin/bash


for network in $(nmcli dev wifi | awk '{print $2}' | sed 1d)
do echo $network
done
