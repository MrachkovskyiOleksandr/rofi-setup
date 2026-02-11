#!/bin/bash
HOME="/home/mrak"

style="
  inputbar { enabled: false;}
  element-icon { enabled: false;}
"

options=$(printf "Theme\nWallpaper\nPower profiles\nConfigs" | rofi -dmenu -p "Menu" -theme-str "$style")

case "$options" in
  "Theme") "$HOME/.config/rofi/menus/theme-switcher.sh" ;;
  "Wallpaper") "$HOME/.config/rofi/menus/wallpapers/wallpaper-switcher.sh" ;;
  "Power"*) "$HOME/.config/rofi/menus/powerprofiles.sh" ;;
  "Configs") "$HOME/.config/rofi/menus/configs.sh" ;;
  esac