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
  echo $1 > $STATUS_BAR/default_status_bar
}

options=$(printf "Waybar\nAGS Bar" | rofi -dmenu -p "Status Bar" -theme-str "$style")

case "$options" in
  *"Waybar"*) kill; waybar & disown; defaultStatusBar "waybar" ;;
  *"AGS"*) kill; ags run & disown; defaultStatusBar "ags run" ;;
esac