!#/bin/zsh
name="Pictures/Screenshots/$(date)"
grim -g "$(slurp)" "$name"
xdg-open "$name"
