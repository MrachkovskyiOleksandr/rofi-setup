#!/bin/bash
HOME="/home/mrak"

style="
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  element-icon { enabled: false;}
"

options=$(printf "Waybar\nAGS\nChange Status Bar" | rofi -dmenu -p "Status Bar" -theme-str "$style")

case "$options" in
  *"Waybar"*) "$HOME/.config/rofi/menus/status-bar/waybar/waybar.sh" ;;
  *"AGS"*) "$HOME/.config/rofi/menus/status-bar/ags/ags.sh" ;;
  *"Status Bar"*) "$HOME/.config/rofi/menus/status-bar/change-status-bar.sh" ;;

esac

