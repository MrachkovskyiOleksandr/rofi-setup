#!/bin/bash
HOME="/home/mrak"

style="
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  element-icon { enabled: false;}
"

options=$(printf "󰏘 | Theme\n󰸉 | Wallpaper\n | Power profiles\n | Configs" | rofi -dmenu -p "Menu" -theme-str "$style")

case "$options" in
  *"Theme"*) "$HOME/.config/rofi/menus/theme-switcher.sh" ;;
  *"Wallpaper"*) "$HOME/.config/rofi/menus/wallpapers/wallpaper-switcher.sh" ;;
  *"Power"*) "$HOME/.config/rofi/menus/powerprofile/powerprofiles.sh" ;;
  *"Configs"*) "$HOME/.config/rofi/menus/configs.sh" ;;
  esac