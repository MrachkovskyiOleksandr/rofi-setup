#!/bin/bash

style="
  inputbar { enabled: false;}
  element-icon { enabled: false;} 
"

options=$(printf "󰌪 | Power saver\n󰾅 | Balanced\n | Performance\n󰂄 | Battery limit" | rofi -dmenu -p "Power profile" -theme-str "$style")

case "$options" in
  *"saver") powerprofilesctl set power-saver ;;
  *"Balanced") powerprofilesctl set balanced ;;
  *"Performance") powerprofilesctl set performance ;;
  *"limit") "$HOME/.config/rofi/menus/powerprofile/battery-limit.sh" ;;
esac