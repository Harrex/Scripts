#!/bin/bash
xrandr --output DP-1 --auto --right-of eDP-1
xrandr --output HDMI-2 --auto --right-of DP-1
i3-msg restart
