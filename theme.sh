#!/bin/zsh
rm -r ~/.cache/wal/

wal -i ~/wallpaper

pkill hyprpaper; pkill waybar
hyprpaper & waybar & disown

hyprctl reload
