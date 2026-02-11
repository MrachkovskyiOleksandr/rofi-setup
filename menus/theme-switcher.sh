#!/bin/bash
HOME="/home/mrak"

style="
  inputbar { enabled: false;}
  element-icon { enabled: false;}
"

options=$(printf "Colors\nThemes" | rofi -dmenu w)

case "$options" in
  "Colors") "$HOME/.config/rofi/change-colors.sh" ;;
  "Themes") "$HOME/.config/rofi/change-theme.sh" ;;
esac