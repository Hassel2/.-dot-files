#!/bin/bash

if [ $1 = 'artist' ]; then
	if !(playerctl metadata xesam:artist); then
		eww update artist="Playing"
	else
		artst="$( playerctl metadata xesam:artist )"
		eww update artist="${artst:0:21}"
	fi;
elif [ $1 = 'title' ]; then
	if !(playerctl metadata xesam:title); then
		eww update title="Nothing"
	else
		ttl="$( playerctl metadata xesam:title )"
		eww update title="${ttl:0:21}"
	fi;
elif [ $1 = 'image' ]; then
	if !(playerctl metadata mpris:artUrl); then
		eww update disk=""
	else
		eww update disk=""
		eww update imgUrl="$(playerctl metadata mpris:artUrl)";
	fi;
fi;
