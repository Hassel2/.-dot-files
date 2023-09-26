#! /usr/bin/env cached-nix-shell
#! nix-shell -i bash -p bash

vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
if [[ "$vol" != *"MUTED"* ]]; then
    lvl=${vol//Volume: /}
    if [[ "$lvl" != "1.00" ]]; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%$1
    elif [[ "$lvl" == "1.00" ]] && [[ "$1" == "-" ]]; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%$1
    fi;
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    lvl=${vol//Volume: /}
    notify-send -h int:value:$(echo "100 * $lvl" | bc) -h string:synchronous:my-progress "Volume info" -i ~/.temp/mic.png
fi;
