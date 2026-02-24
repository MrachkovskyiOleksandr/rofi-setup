#!/bin/bash

PREVIEW_FILE="/tmp/cliphist_preview"

selection=$(cliphist list | rofi -dmenu \
    -p "Clipboard" \
    -kb-custom-1 "Control+Return" \
    -kb-custom-2 "Delete" \
    -kb-custom-3 "Control+Shift+Delete" \
    -kb-accept-custom "" \
    -kb-remove-char-forward "" \-display-columns 2 \
    -theme-str 'element-icon { enabled: false; }')

exit_code=$?

if [ -z "$selection" ]; then
    exit 0
fi

case $exit_code in
    0) 
        echo "$selection" | cliphist decode | wl-copy
        ;;
    10) 
        echo "$selection" | cliphist decode > "$PREVIEW_FILE"
        if file --mime-type "$PREVIEW_FILE" | grep -q "image/"; then
            swayimg "$PREVIEW_FILE" &
        else
            notify-send "Clipboard" "Not an image!" -t 1000
        fi
        ;;
    11)
        echo "$selection" | cliphist delete
        notify-send "Clipboard" "Deleted entry." -t 800
        ;;
    12)
        confirm=$(echo -e "No\nYes" | rofi -dmenu -p "Wipe all history?" -theme-str 'window {width: 200px;}')
        if [ "$confirm" == "Yes" ]; then
            cliphist wipe
            notify-send "Clipboard" "History Wiped." -t 1000
        fi
        ;;
esac