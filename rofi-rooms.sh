#!/bin/bash

# themes_folder="/home/harrek/Pictures/Wallpapers/rooms/"
# themes_folder="/home/harrek/Pictures/Wallpapers/Planets/"
# themes_folder="/home/harrek/Pictures/Wallpapers/new/chosen/"
themes_folder="/home/harrek/Pictures/Wallpapers/Current/"

themes=$(ls "$themes_folder")
selected_theme="$themes_folder$(echo "$themes" | rofi -dmenu -i -p "Pick a room")"
echo $selected_theme


/home/harrek/Scripts/refresh_wal.sh "$selected_theme" $1
