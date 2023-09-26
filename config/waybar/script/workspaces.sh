#! /usr/bin/env cached-nix-shell
#! nix-shell -i bash -p bash
#
active=($( hyprctl workspaces -j | jq .[].id ));
current=($( hyprctl monitors -j | jq .[].activeWorkspace.id ))

workspaces='{"text":"'

for (( i=1; i<=10; i++ )) do
    workspaces=$workspaces'<span color=\"#1e1e2e\">.</span>'
    if [[ " ${current[*]} " =~ " ${i} " ]]; then
        workspaces=$workspaces'<span color=\"#cdd6f4\"><big></big></span>'
    elif [[ " ${active[*]} " =~ " ${i} " ]]; then
        workspaces=$workspaces'<span color=\"#cdd6f4\"><big></big></span>'
    else
        workspaces=$workspaces'<span color=\"#313244\"><big></big></span>'
    fi;
    workspaces=$workspaces'<span color=\"#1e1e2e\">.</span>'
done;

workspaces=$workspaces'"}'

echo $workspaces 
