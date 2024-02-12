#!/bin/bash
DIRECTORY="/home/harrek"

kitty bash -c "cd $DIRECTORY && fzf > /tmp/fzf-xdg-selection" -o OPTION
option="$DIRECTORY/$(cat /tmp/fzf-xdg-selection)"
app=$(xdg-mime query default "$(xdg-mime query filetype "$option")")

# Overrides for certain programs - Open in new terminal
if [[ $app == "nvim.desktop" ]]; then
    exec kitty -e nvim "$option"
else
    xdg-open "$option"
fi
