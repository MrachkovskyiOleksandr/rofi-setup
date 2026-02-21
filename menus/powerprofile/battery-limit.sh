#!/bin/bash

style="
  inputbar { enabled: false;}
  element-icon { enabled: false;} 
"

options=$(printf "󰜃 | One-shot\n󰁹 | 100%%\n󰂂 | 90%%\n󰂁 | 80%%" | rofi -dmenu -p "Battery limit" -theme-str "$style")

case "$options" in
  *"One"*) asusctl battery oneshot ;;
  *"100"*) asusctl battery limit 100 ;;
  *"90"*) asusctl battery limit 90 ;;
  *"80"*) asusctl battery limit 80 ;;
esac