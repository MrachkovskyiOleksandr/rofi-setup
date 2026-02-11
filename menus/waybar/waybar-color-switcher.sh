#!/bin/bash

HOME="/home/mrak"
COLORS_DIR="$HOME/.config/waybar/colors"
LINK_TARGET="$HOME/.config/waybar/color.css"


style="
  inputbar { enabled: true;}
  element-icon { enabled: false;}  
"

option=$(ls "$COLORS_DIR" | sed 's/\.css//' | rofi -dmenu -p "Themes" -theme-str "$style")

if [ -z "$option" ]; then
    exit 1    
fi

ln -sf "$COLORS_DIR/$option.css" "$LINK_TARGET"

.config/waybar/scripts/launch.sh

notify-send "Waybar Theme" "Color switched to $option"