#!/bin/bash

style="
  inputbar { enabled: false;}
  element-icon { enabled: false;} 
"

# Battery limit info
bat_limit=$(asusctl battery info)

# Rofi dmenu assembly
options=$(printf "󰜃 | One-shot\n󰁹 | 100%%\n󰂂 | 90%%\n󰂁 | 80%%" | rofi -dmenu -p "Battery limit" -mesg "$bat_limit" -theme-str "$style")

notification() {
  notify-send "Battery limit" "Battery limit is set to: $1"
}

case "$options" in
  *"One"*) asusctl battery oneshot | notification "One-shot" ;;
  *"100"*) asusctl battery limit 100 | notification "100%" ;;
  *"90"*) asusctl battery limit 90 | notification "90%" ;;
  *"80"*) asusctl battery limit 80 | notification "80%" ;;
esac