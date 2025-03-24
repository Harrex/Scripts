#!/bin/zsh

(xdg-open "$(find $1 -type f | rofi -dmenu -i)")

