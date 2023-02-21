#!/bin/bash

function handle {
  if [[ ${1:0:9} == "workspace" ]]; then
     pkill -RTMIN+8 waybar 
  fi
}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
