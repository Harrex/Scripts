!#/bin/zsh
name="Pictures/Screenshots/$(date).jpg"
# grim -g "$(slurp)" "$name"
# xdg-open "$name"
grim -g "$(slurp)" - | wl-copy
