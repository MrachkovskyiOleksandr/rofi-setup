#!/bin/bash
HOME="/home/mrak"

STATUS_BAR="$HOME/.config/hypr"

style="
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  element-icon { enabled: false;}
"
kill() {
  pkill waybar
  ags quit
}

defaultStatusBar(){
  echo "$1" > $STATUS_BAR/status-bar.conf
}

options=$(printf "Waybar\nAGS Bar" | rofi -dmenu -p "Status Bar" -theme-str "$style")

case "$options" in
  *"Waybar"*) kill; waybar & disown; defaultStatusBar "exec-once = waybar" ;;
  *"AGS"*) kill; ags run & disown; defaultStatusBar "exec-once = ags run" ;;
esac