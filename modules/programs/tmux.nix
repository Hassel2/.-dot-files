{ pkgs, ... }:
let 
  thm_bg="#313244";
  thm_bg1="#585b70";
  thm_bg2="#7f849c";
  thm_fg="#cdd6f4";
  thm_cyan="#89dceb";
  thm_black="#181825";
  thm_gray="#313244";
  thm_magenta="#cba6f7";
  thm_pink="#f5c2e7";
  thm_red="#f38ba8";
  thm_green="#a6e3a1";
  thm_yellow="#f9e2af";
  thm_blue="#89b4fa";
  thm_orange="#fab387";
  thm_black4="#585b70";
in
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    newSession = true;
    escapeTime = 0;
    prefix = "M-c";
    extraConfig = ''
      # Move to next and prev windows with Alt+(j/k)
      bind -n M-j previous-window
      bind -n M-k next-window

      # Press Alt+%window-number% to go to specific window
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9
      bind -n M-0 select-window -t 10

      # Press Alt+n to create a new window
      bind -n M-n new-window


      # Start windows and panes at 1, not 0
      set -g base-index 1
      setw -g pane-base-index 1

      set-option -g status-position top
      set-option -g status "on"
      # default statusbar color
      set-option -g status-style bg=${thm_bg},fg=${thm_fg} # bg=bg1, fg=fg1
      # default window title colors
      set-window-option -g window-status-style bg=${thm_orange},fg=${thm_bg} # bg=yellow, fg=bg1
      # default window with an activity alert
      set-window-option -g window-status-activity-style bg=${thm_bg},fg=${thm_fg} # bg=bg1, fg=fg3
      # active window title colors
      set-window-option -g window-status-current-style bg=${thm_red},fg=${thm_bg} # fg=bg1
      # pane border
      set-option -g pane-active-border-style fg=${thm_fg} #fg2
      set-option -g pane-border-style fg=${thm_bg} #bg1
      # message infos
      set-option -g message-style bg=${thm_bg1},fg=${thm_fg} # bg=bg2, fg=fg1
      # writing commands inactive
      set-option -g message-command-style bg=${thm_fg},fg=${thm_bg} # bg=fg3, fg=bg1
      # pane number display
      set-option -g display-panes-active-colour ${thm_fg} #fg2
      set-option -g display-panes-colour ${thm_bg} #bg1
      # clock
      set-window-option -g clock-mode-colour ${thm_blue} #blue
      # bell
      set-window-option -g window-status-bell-style bg=${thm_red},fg=${thm_bg} # bg=red, fg=bg
      # Theme settings mixed with colors (unfortunately, but there is no cleaner way)
      set-option -g status-justify "left"
      set-option -g status-left-style none
      set-option -g status-left-length "80"
      set-option -g status-right-style none
      set-option -g status-right-length "80"
      set-window-option -g window-status-separator ""

      set-option -g status-left "#[bg=${thm_bg2},fg=${thm_fg}] #S #[bg=${thm_bg},fg=${thm_bg2},nobold,noitalics,nounderscore]"
      set-option -g status-right "#[bg=${thm_bg},fg=${thm_bg1} nobold, nounderscore, noitalics]#[bg=${thm_bg1},fg=${thm_fg}] %Y-%m-%d  %H:%M #[bg=${thm_bg1},fg=${thm_bg2},nobold,noitalics,nounderscore]#[bg=${thm_bg2},fg=${thm_fg}] #h "

      set-window-option -g window-status-current-format "#[bg=${thm_orange},fg=${thm_bg},nobold,noitalics,nounderscore]#[bg=${thm_orange},fg=${thm_bg}] #I #[bg=${thm_orange},fg=${thm_bg},bold] #W#{?window_zoomed_flag,*Z,} #[bg=${thm_bg},fg=${thm_orange},nobold,noitalics,nounderscore]"
      set-window-option -g window-status-format "#[bg=${thm_bg1},fg=${thm_bg},noitalics]#[bg=${thm_bg1},fg=${thm_fg}] #I #[bg=${thm_bg1},fg=${thm_fg}] #W #[bg=${thm_bg},fg=${thm_bg1},noitalics]"
    '';
  };
}
