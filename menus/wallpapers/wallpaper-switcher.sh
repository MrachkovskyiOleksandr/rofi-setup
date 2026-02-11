#!/bin/bash
HOME="/home/mrak"
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

style="
  inputbar { enabled: false;}
  element-icon {
    enabled: true;
    size: 250px;
  }
  element-text {
    enabled: false;
  }
  listview {
    fixed-columns: false;
    scrollbar: true;
    
    layout: horizontal;
  }
"

# Generate the list with icons and pass it to rofi
options=$(
    find "$WALLPAPERS_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read -r img; do
        # Display only the filename but point the icon to the full path
        echo -en "${img##*/}\0icon\x1f${img}\n"
    done | rofi -dmenu -p "Wallpaper" -show-icons -theme-str "$style"
)

# Use the 'find' result to set the wallpaper
if [ -n "$options" ]; then
    # Since we only displayed the filename, we find the full path again to apply it
    target=$(find "$WALLPAPERS_DIR" -name "$options" | head -n 1)
    # Add your wallpaper setting command here, e.g., feh --bg-fill "$target"

    matugen image $target --contrast 0.1
fi