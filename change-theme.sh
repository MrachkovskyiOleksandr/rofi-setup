#!/bin/bash

THEME_DIR="$HOME/.config/rofi/themes"
LINK_TARGET="$HOME/.config/rofi/theme.rasi"

style="
  element-icon { enabled: false;}
"

option=$(ls "$THEME_DIR" | sed 's/\.rasi//' | rofi -dmenu -p "Change theme" -theme-str "$style")

if [ -z "$option" ]; then
    exit 1
fi

ln -sf "$THEME_DIR/$option.rasi" "$LINK_TARGET"

notify-send "Rofi Theme" "Theme switched to $option"