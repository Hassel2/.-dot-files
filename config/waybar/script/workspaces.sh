#!/bin/bash

active=($( hyprctl workspaces -j | jq .[].id ));
current=($( hyprctl monitors -j | jq .[].activeWorkspace.id ))

workspaces=$workspaces'{"text":'$1','

if [[ " ${current[*]} " =~ " ${1} " ]]; then
	workspaces=$workspaces'"class":"current"'
elif [[ " ${active[*]} " =~ " ${1} " ]]; then
	workspaces=$workspaces'"class":"active"'
else
	workspaces=$workspaces'"class":"unactive"'
fi;

workspaces=$workspaces'}'

echo $workspaces 

