{ pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
            exec-once = "waybar -c ~/.config/waybar/config.json";
            exec-once = "swaybg -i ~/.wallpapers/everforest.png &";
            exec-once = "$HOME/.config/hypr/script/workspaces.sh";

            input = {
                kb_layout = "us,ru";
                kb_options = "grp:caps_toggle";

                follow_mouse = 1;

                touchpad  = {
                    natural_scroll = false;
                    disable_while_typing = true;
                    clickfinger_behavior = true;
                };

                sensitivity = 0;
            };

            general = {
                gaps_in = 0;
                gaps_out = 0;
                border_size = 0;
                "col.active_border" = "rgba(b8bb2600)";
                "col.inactive_border" = "rgba(59595900)";

                layout = "dwindle";
            };

            decoration = {
                multisample_edges = false;

                rounding = 10;

                blur = {
                    enabled = true;
                    size = 10;
                    passes = 3;
                    new_optimizations = true;
                };

                drop_shadow = true;
                shadow_range = 10;
                shadow_render_power = 3;
                "col.shadow" = "rgba(1a1a1aee)";
            };

            animations = {
                enabled = true;

                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 5, default, slide"
                ];
            };

            dwindle = {
                pseudotile = true; 
                preserve_split = true; 
            };

            master = {
                new_is_master = true;
            };

            gestures = {
                workspace_swipe = true;
            };

            windowrule = [
                "float,^(feh)$"
                "size 1000 800,^(feh)$"
                "center,^(feh)$"

                "float,^(pavucontrol)$"
                "size 800 600,^(pavucontrol)$"
                "center,^(pavucontrol)$"
            ];

            "$mainMod" = "SUPER";

            bind = [
                "$mainMod_SHIFT, Return, exec, st -e tmux attach-session || st -e tmux new"
                "$mainMod, Return, exec, st"
                "$mainMod_SHIFT, Q, killactive," 
                "$mainMod, M, exec, $HOME/.config/hypr/script/eww_player.sh"
                "$mainMod, E, exec, dolphin"
                "$mainMod, S, togglefloating," 
                "$mainMod, B, exec, killall -SIGUSR1 waybar"
                "$mainMod_SHIFT, B, exec, killall waybar && waybar -c ~/.config/waybar/config.json"
                "$mainMod, D, exec, rofi -show drun -theme ~/dotfiles/config/hypr/rofi/applauncher.rasi"
                "$mainMod, P, pseudo," # dwindle
                "$mainMod, J, togglesplit," # dwindle
                "$mainMod, F, fullscreen," # dwindle

                # Move focus with mainMod + arrow keys
                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"

                "$mainMod,R,submap,resize" # will switch to a submap called resize
                
                # Switch workspaces with mainMod + [0-9]
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"
                "$mainMod, 0, workspace, 10"

                # Move active window to a workspace with mainMod + SHIFT + [0-9]
                "$mainMod SHIFT, 1, movetoworkspace, 1"
                "$mainMod SHIFT, 2, movetoworkspace, 2"
                "$mainMod SHIFT, 3, movetoworkspace, 3"
                "$mainMod SHIFT, 4, movetoworkspace, 4"
                "$mainMod SHIFT, 5, movetoworkspace, 5"
                "$mainMod SHIFT, 6, movetoworkspace, 6"
                "$mainMod SHIFT, 7, movetoworkspace, 7"
                "$mainMod SHIFT, 8, movetoworkspace, 8"
                "$mainMod SHIFT, 9, movetoworkspace, 9"
                "$mainMod SHIFT, 0, movetoworkspace, 10"

                # Scroll through existing workspaces with mainMod + scroll
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"

                "XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                # Brightness
                ",XF86MonBrightnessUp, exec, $HOME/.config/hypr/script/brightness.sh -A"
                ",XF86MonBrightnessDown, exec, $HOME/.config/hypr/script/brightness.sh -U"

                # Screen locker
                "$mainMod, L, exec, swaylock --screenshot --effect-blur 7x5 --indicator-thickness 7"

                # Screenshots
                "CTRL,Print,exec,fish -c screenshotarea"
                ",Print,exec,fish -c screenshot"

                ",escape,submap,reset" # use reset to go back to the global submap
            ];

            bindm = [
                # Move/resize windows with mainMod + LMB/RMB and dragging
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];

            # Volume
            binde = [
                ",XF86AudioLowerVolume, exec, $HOME/.config/hypr/script/volume.sh -"
                    ",XF86AudioRaiseVolume, exec, $HOME/.config/hypr/script/volume.sh +"
            ];

            submap = "resize"; # will start a submap called "resize"
            binde = [
                ",right,resizeactive,10 0"
                ",left,resizeactive,-10 0"
                ",up,resizeactive,0 -10"
                ",down,resizeactive,0 10"
            ];

            submap = "reset"; # will reset the submap, meaning end the current one and return to the global one.
        };
    };
}
