#!/bin/bash
theme_file=$(cat "/home/harrek/Themes/$1.theme")
echo $theme_file
wal -i $theme_file
swww img -t wipe --transition-duration 0 $theme_file
