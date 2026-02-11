#!/bin/bash

HOME="/home/mrak"
THEMES_DIR="$HOME/.config/waybar/themes"
LINK_TARGET="$HOME/.config/waybar"


style="
  inputbar { enabled: true;}
  element-icon { enabled: false;}  
"

option=$(ls "$THEMES_DIR" | rofi -dmenu -p "Themes" -theme-str "$style")

if [ -z "$option" ]; then
    exit 1
fi

ln -sf "$THEMES_DIR/$option/config.jsonc" "$LINK_TARGET/config.jsonc"
ln -sf "$THEMES_DIR/$option/style.css" "$LINK_TARGET/style.css"

.config/waybar/scripts/launch.sh

notify-send "Waybar Theme" "Theme switched to $option"