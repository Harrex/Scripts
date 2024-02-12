#!/bin/bash
#rofi -modi music:rofi-music-pdfs.sh -show music

# if [ x"$@" = x"quit" ]
# then
#     exit 0
# fi


# DIRECTORY="/home/harrek/Music"
DIRECTORY="$1"

kitty bash -c "cd $DIRECTORY && find . -name '*.pdf' | fzf > /tmp/fzf-music-selection" -o OPTION
zathura --fork "$DIRECTORY/$(cat /tmp/fzf-music-selection)" > /dev/null & exit 0
