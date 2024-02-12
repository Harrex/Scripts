#!/bin/bash                                                                          
# specify the directory in place of /path/to/directory                               
# DIR="/home/harrek/Pictures/Wallpapers/Planets"                                                             
# DIR="/home/harrek/Pictures/Wallpapers/new/chosen"                                                             
DIR="/home/harrek/Pictures/Wallpapers/Current"                                                             

# CURRENT_WALLPAPER="retrowave.png"
                                                                                     
# use shuf to select a random file                                                   
if [ -z $CURRENT_WALLPAPER ]
then
    selected_theme="$DIR/$(ls "$DIR" | shuf -n 1)"
else
    selected_theme="$CURRENT_WALLPAPER"
fi

notify-send 'Theme Changed'
/home/harrek/Scripts/refresh_wal.sh "$selected_theme" "$1"
