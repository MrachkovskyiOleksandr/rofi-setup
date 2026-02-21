#!/bin/bash
HOME="/home/mrak"
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

style="
  window {
    width: 1128px;
  }
  inputbar {
    enabled: false;
    children: ["prompt"];
  }
  listview {
    fixed-columns: true;
    scrollbar: true;
    columns: 5;
    layout: horizontal;
  }
  element-icon {
    enabled: true;
    size: 250px;
  }
  element-text {
    enabled: false;
  }
"

options=$(
    find "$WALLPAPERS_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read -r img; do
        echo -en "${img##*/}\0icon\x1f${img}\n"
    done | rofi -dmenu -p "Wallpaper" -show-icons -theme-str "$style"
)

if [ -n "$options" ]; then
    target=$(find "$WALLPAPERS_DIR" -name "$options" | head -n 1)

    matugen image $target --contrast 0.1
fi