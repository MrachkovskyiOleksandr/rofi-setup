#!/bin/bash

style="
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  element-icon { enabled: false;} 
"

# Power profile info
pow_prof=$(powerprofilesctl get)
case "$pow_prof" in 
  "power-saver") value="Power saver" ;;
  "balanced") value="Balanced" ;;
  "performance") value="Performance" ;;
esac

# Usefull info about battery and power profile
message=$(printf "Current power profile: $value")


# Rofi dmenu assembly
list="󰌪 | Power saver\n󰾅 | Balanced\n | Performance\n󰂄 | Battery limit"

options=$(printf "$list" | rofi -dmenu -p "Power profile" -mesg "$message" -theme-str "$style")

notification() {
  notify-send "Power profile" "Power profile is set to: $1"
}

case "$options" in
  *"saver") powerprofilesctl set power-saver | notification "Power saver" ;;
  *"Balanced") powerprofilesctl set balanced | notification "Balanced" ;;
  *"Performance") powerprofilesctl set performance | notification "Performance" ;;
  *"limit") "$HOME/.config/rofi/menus/powerprofile/battery-limit.sh" ;;
esac
