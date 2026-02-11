#!/bin/bash

HOME="/home/mrak"

style="
  inputbar { enabled: false;}
  element-icon { enabled: false;}  
"

options=$(printf "Waybar\nHyprland\nHypridle\nHyprlock\nRofi\nOhMyZsh" | rofi -dmenu -p "Configs" -theme-str "$style")

case "$options" in
  "Waybar") "$HOME/.config/rofi/menus/waybar/waybar.sh" ;;
  "Hyprland") codium "$HOME/.config/hypr/hyprland.conf" ;;
  "Hypridle") codium "$HOME/.config/hypr/hypridle.conf" ;;
  "Hyprlock") codium "$HOME/.config/hypr/hyprlock.conf" ;;
  "Rofi") codium "$HOME/.config/rofi" ;;
  "OhMyZsh") codium "$HOME/.zshrc" ;;
esac