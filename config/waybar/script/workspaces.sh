#! /usr/bin/env cached-nix-shell
#! nix-shell -i bash -p bash

active=($( hyprctl workspaces -j | jq .[].id ));
current=($( hyprctl monitors -j | jq .[].activeWorkspace.id ))

workspaces='{"text":"'

for (( i=1; i<=10; i++ )) do
    workspaces=$workspaces'.'
    if [[ " ${current[*]} " =~ " ${i} " ]]; then
        workspaces=$workspaces'<span color=\"#A7C080\"></span>'
    elif [[ " ${active[*]} " =~ " ${i} " ]]; then
        workspaces=$workspaces'<span color=\"#A7C080\"></span>'
    else
        workspaces=$workspaces'<span color=\"#56635f\"></span>'
    fi;
    workspaces=$workspaces'.'
done;

workspaces=$workspaces'"}'

echo $workspaces 
