#!/bin/bash

GAMES_DIR="$HOME/Desktop"

style="
  element-icon { enabled: true;}
"

list_games() {
    for file in "$GAMES_DIR"/*.desktop; do
        # Extract Name and Icon from the .desktop file
        name=$(basename "$file" | sed 's/\.desktop//')
        icon=$(grep -m 1 "^Icon=" "$file" | cut -d'=' -f2)
        
        # Output in Rofi's special format: Name + hidden icon data
        echo -en "$name\0icon\x1f$icon\n"
    done
}

option=$(list_games | rofi -dmenu -p "Games" -theme-str "$style")

if [ -z "$option" ]; then
    exit 1
fi

gio launch "$GAMES_DIR/$option.desktop";
