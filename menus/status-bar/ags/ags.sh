#!/bin/bash

HOME="/home/mrak"

style="
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  element-icon { enabled: false;}  
"

options=$(printf "Themes\nColors\nConfig" | rofi -dmenu -p "AGS" -theme-str "$style")

case "$options" in
  # "Themes") "$HOME/.config/rofi/menus/waybar/waybar-theme-switcher.sh" ;;
  # "Colors") "$HOME/.config/rofi/menus/waybar/waybar-color-switcher.sh" ;;
  # "Config") codium "$HOME/.config/waybar/config.jsonc" ;;
esac