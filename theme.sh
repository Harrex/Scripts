#!/bin/zsh
rm -r ~/.cache/wal/

if [ "$1" = "--light" ] 
then
    wal -li ~/wallpaper
else
    wal -i ~/wallpaper
fi

sleep 2

pkill hyprpaper; pkill waybar
hyprpaper & waybar & disown

sleep 1; kitty +kitten panel --edge background --lines 15 --config ~/.config/kitty/panel.conf zsh -c "cava -p ~/.config/cava/cava-background" & disown

sleep 1; pkill kanshi && kanshi

hyprctl reload
