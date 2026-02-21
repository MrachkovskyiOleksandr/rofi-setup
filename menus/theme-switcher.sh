#!/bin/bash
HOME="/home/mrak"

style="
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  element-icon { enabled: false;}
"

options=$(printf "󰏘 | Colors\n | Themes" | rofi -dmenu -theme-str "$style" )

case "$options" in
  *"Colors"*) "$HOME/.config/rofi/change-colors.sh" ;;
  *"Themes"*) "$HOME/.config/rofi/change-theme.sh" ;;
esac