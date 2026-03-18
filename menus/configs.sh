#!/bin/bash

HOME="/home/mrak"

style="
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  element-icon { enabled: false;}  
"

options=$(printf "󱔓 | Status Bar\n󱂬 | Hyprland\n󰇘 | Hypridle\n | Hyprlock\n | Rofi\n | OhMyZsh" | rofi -dmenu -p "Configs" -theme-str "$style")

case "$options" in
  *"Hyprland"*) codium "$HOME/.config/hypr/hyprland.conf" ;;
  *"Hypridle"*) codium "$HOME/.config/hypr/hypridle.conf" ;;
  *"Hyprlock"*) "$HOME/.config/rofi/menus/hyprlock/hyprlock.sh" ;;
  *"Status Bar"*) "$HOME/.config/rofi/menus/status-bar/status-bar.sh" ;;
  *"Rofi"*) codium "$HOME/.config/rofi" ;;
  *"OhMyZsh"*) codium "$HOME/.zshrc" ;;
esac