#!/bin/zsh

x=$(echo $1 | sed "s/.*\.\(.*\)/\1/")
echo ---------------------------$x
if [[ "$x" == "json" ]] 
then
    echo "-----------------------------_Here"
    image=$(cat $1 | jq -r '.wallpaper')
    wal --theme "$1"
else
    image="$1"
    if [[ "$2" == "--light" ]]
    then
        wal -li "$1"
    else
        wal -i "$1"
    fi
fi

echo "-------------------------$image"

swww img -t wipe --transition-duration 0 "$image"
echo $image > ~/.config/hypr/default_wallpaper

makoctl reload
/home/harrek/Scripts/chromium-pywal/chromium-pywal.sh
pkill waybar; waybar -c ~/.config/waybar/YoRHA/config.jsonc -s ~/.config/waybar/YoRHA/style.css
# pkill waybar; waybar
