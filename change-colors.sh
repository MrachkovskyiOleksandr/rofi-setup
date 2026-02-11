#!/bin/bash

COLOR_DIR="$HOME/.config/rofi/colors"
LINK_TARGET="$HOME/.config/rofi/colors.rasi"

COLORS_LIST=$(ls "$COLOR_DIR")

style="
  element-icon { enabled: false;}
"

option=$(printf "Material You\n$COLORS_LIST" | sed 's/\.rasi//' | rofi -dmenu -p "Change colors" -theme-str "$style")

if [ -z "$option" ]; then
    exit 1
fi

case $option in
  "Material"*) ".config/matugen/material-you.sh";;
  *) ln -sf "$COLOR_DIR/$option.rasi" "$LINK_TARGET";;
esac


notify-send "Rofi Theme" "Colors switched to $option"