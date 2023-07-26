#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

light $1 1
notify-send -h int:value:$(light -G) -h string:synchronous:my-progress "Brightness info" -i ~/.temp/bright.png
