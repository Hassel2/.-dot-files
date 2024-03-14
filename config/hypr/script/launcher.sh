#! /usr/bin/env cached-nix-shell
#! nix-shell -i bash -p bash

dir="$HOME/.config/hypr/rofi/"
theme='applauncher'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
