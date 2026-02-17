#!/bin/bash

HOME="/home/mrak"
THEMES_DIR="$HOME/.config/hypr/hyprlock/themes"
LINK_TARGET="$HOME/.config/hypr"


style="
  inputbar { enabled: true;}
  element-icon { enabled: false;}  
"

option=$(ls "$THEMES_DIR" | sed 's/\.conf//'| rofi -dmenu -p "Themes" -theme-str "$style")

if [ -z "$option" ]; then
    exit 1
fi

ln -sf "$THEMES_DIR/$option.conf" "$LINK_TARGET/hyprlock.conf"

notify-send "Hyprlock Theme" "Theme switched to $option"