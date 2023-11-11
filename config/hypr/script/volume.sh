#! /usr/bin/env cached-nix-shell
#! nix-shell -i bash -p bash

vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
if [[ "$vol" != *"MUTED"* ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%$1 --limit 1.5
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    lvl=${vol//Volume: /}
    notify-send -h int:value:$(echo "66.66666666 * $lvl" | bc) -h string:synchronous:my-progress "Volume info" -i ~/.temp/mic.png
fi;
