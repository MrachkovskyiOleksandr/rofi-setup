#!/bin/bash

style="
  inputbar { enabled: false;}
  element-icon { enabled: false;} 
"

options=$(printf "󰌪 Power saver\n󰾅 Balanced\n Performance" | rofi -dmenu -p "Power profile" -theme-str "$style")

case "$options" in
  *"saver") powerprofilesctl set power-saver ;;
  *"Balanced") powerprofilesctl set balanced ;;
  *"Performance") powerprofilesctl set performance ;;
esac