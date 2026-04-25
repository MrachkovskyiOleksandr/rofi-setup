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

send_notification() {
  notify-send "" \
              "$1" \
              -h string:category:"system" \
              -i "power-profile-$2"
}

case "$options" in
  *"saver") powerprofilesctl set power-saver | send_notification "Power saver" "power-saver";;
  *"Balanced") powerprofilesctl set balanced | send_notification "Balanced" "balanced";;
  *"Performance") powerprofilesctl set performance | send_notification "Performance" "performance";;
  *"limit") "$HOME/.config/rofi/menus/powerprofile/battery-limit.sh" ;;
esac
