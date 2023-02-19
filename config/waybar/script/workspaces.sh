#!/bin/bash

active=($( hyprctl workspaces -j | jq .[].id ));
current=($( hyprctl monitors -j | jq .[].activeWorkspace.id ))


if [[ " ${current[*]} " =~ " ${1} " ]]; then
	workspaces=$workspaces'{"text":"<span color=\"#cdd6f4\"></span>",'
	workspaces=$workspaces'"class":"current"'
elif [[ " ${active[*]} " =~ " ${1} " ]]; then
	workspaces=$workspaces'{"text":"<span color=\"#cdd6f4\"></span>",'
	workspaces=$workspaces'"class":"active"'
else
	workspaces=$workspaces'{"text":"<span color=\"#313244\"></span>",'
	workspaces=$workspaces'"class":"unactive"'
fi;

workspaces=$workspaces'}'

echo $workspaces 

