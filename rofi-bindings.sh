#!/bin/bash

HYPR_BINDINGS="$HOME/.config/hypr/all/binds.conf"

mainMod=$(grep '\$mainMod = ' $HYPR_BINDINGS | sed 's/.* = .* \# \(.*\)/\1/')
s=$(grep '\$shift = ' $HYPR_BINDINGS         | sed 's/.* = .* \# \(.*\)/\1/')
alt=$(grep '\$alt = ' $HYPR_BINDINGS         | sed 's/.* = .* \# \(.*\)/\1/')
ctrl=$(grep '\$ctrl = ' $HYPR_BINDINGS       | sed 's/.* = .* \# \(.*\)/\1/')

echo $mainMod $s $alt $ctrl

# extract the keybinding from hyprland.conf
mapfile -t BINDINGS < <(grep '^bind *=' "$HYPR_BINDINGS" \
    | sed -e 's/  */ /g' -e 's/bind *= *//g' \
    -e 's/\([^,]*\), \([^,]*\), \([^#]*\)* # \(.*\)/<b>\1 \2<\/b>  <u>\4<\/u> (\3)/' \
    -e 's/\([^,]*\), \([^,]*\), \([^#]*\)*/<b>\1 \2<\/b>  \3/' \
    -e 's/[exec],/ /g' \
    -e 's/\$mainMod/'"$mainMod"'/g' \
    -e 's/\$shift/'"$s"'/g' \
    -e 's/\$alt/'"$alt"'/g' \
    -e 's/\$ctrl/'"$ctrl"'/g' \
)

echo $BINDINGS

CHOICE=$(printf '%s\n' "${BINDINGS[@]}" | rofi -dmenu -i -markup-rows -p "Hyprland Keybinds:")

# extract cmd from span <span color='gray'>cmd</span>
CMD=$(echo "$CHOICE" | sed -n 's/.*<span color='\''gray'\''>\(.*\)<\/span>.*/\1/p')

# execute it if first word is exec else use hyprctl dispatch
if [[ $CMD == exec* ]]; then
    eval "$CMD"
else
    hyprctl dispatch "$CMD"
fi

