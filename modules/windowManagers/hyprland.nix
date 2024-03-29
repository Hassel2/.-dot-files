{ pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
            exec-once = [
                "waybar -c ~/.config/waybar/config.json"
                "swaybg -i ~/.wallpapers/everforest.png &"
            ];

            env = [
                "WLR_NO_HARDWARE_CURSORS,1"
            ];

            monitor = [
                "eDP-1,1920x1080@60,0x0,1"
                ",preferred,auto,1,mirror,eDP-1"
            ];

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
                gaps_in = 5;
                gaps_out = 5;
                border_size = 0;
                "col.active_border" = "rgba(b8bb2600)";
                "col.inactive_border" = "rgba(59595900)";

                layout = "dwindle";
            };

            decoration = {
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

                bezier = [
                    "mycurve,.32,.97,.53,.98"
                    "overshot,.32,.97,.37,1.16"
                ];

                animation = [
                    "windowsMove,1,4,overshot"
                    "windowsIn,1,3,mycurve"
                    "windowsOut,1,10,mycurve,popin 80%"
                    "fadeIn,1,3,mycurve"
                    "fadeOut,1,3,mycurve"
                    "workspaces,1,3.5,default,slide"
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

            layerrule = [
                "blur,waybar"
                "blur,swaync-notification-window"
                "blur,swaync-control-center"
                "ignorezero,swaync-notification-window"
                "ignorezero,swaync-control-center"
            ];

            submap = "default";
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
 
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                # Brightness
                ",XF86MonBrightnessUp, exec, $HOME/.config/hypr/script/brightness.sh -A"
                ",XF86MonBrightnessDown, exec, $HOME/.config/hypr/script/brightness.sh -U"

                # Screen locker
                "$mainMod, L, exec, swaylock --screenshot --effect-blur 7x5 --indicator-thickness 7"

                # Screenshots
                "CTRL,Print,exec,fish -c screenshotarea"
                ",Print,exec,fish -c screenshot"
            ];

            bindm = [
                # Move/resize windows with mainMod + LMB/RMB and dragging
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];

            # Volume
            binde = [
                ",XF86AudioLowerVolume, exec, $HOME/dotfiles/config/hypr/script/volume.sh -"
                ",XF86AudioRaiseVolume, exec, $HOME/dotfiles/config/hypr/script/volume.sh +"
            ];
        };

        extraConfig = ''
            submap=resize

            binde=,right,resizeactive,10 0
            binde=,left,resizeactive,-10 0
            binde=,up,resizeactive,0 -10
            binde=,down,resizeactive,0 10

            bind=,escape,submap,reset

            submap=default
        '';
    };
}
