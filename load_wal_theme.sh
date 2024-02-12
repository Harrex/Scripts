#!/bin/bash                                                                          
# specify the directory in place of /path/to/directory                               
# DIR="/home/harrek/Pictures/Wallpapers/Planets"                                                             
# DIR="/home/harrek/Pictures/Wallpapers/new/chosen"                                                             
                                                                                     
wal --theme "$1"
/home/harrek/Scripts/refresh_wal.sh "$(cat $1 | jq -r '.wallpaper')"
notify-send 'Theme Changed'
