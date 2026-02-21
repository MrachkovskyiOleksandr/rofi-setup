#!/bin/bash

HOME="/home/mrak"

style="
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  element-icon { enabled: false;}  
"

options=$(printf "Theme\nConfig" | rofi -dmenu -p "Hyprlock" -theme-str "$style")

case "$options" in
  "Theme") "$HOME/.config/rofi/menus/hyprlock/hyprlock-theme-switcher.sh" ;;
  "Config") codium "$HOME/.config/hypr/hyprlock.conf" ;;
esac