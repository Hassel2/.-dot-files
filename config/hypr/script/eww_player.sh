#!/bin/bash

if !(eww close player); then
	while true; do
		status=$(playerctl status)
		$HOME/.config/eww/script/playerctl.sh artist
		$HOME/.config/eww/script/playerctl.sh image
		$HOME/.config/eww/script/playerctl.sh title
		if [ $status = "Playing" ]; then
			eww update playpause=""
		else
			eww update playpause=""
		fi;
		eww open player
		# sleep 0.5 
	done;
else
	killall eww_player.sh
fi;
