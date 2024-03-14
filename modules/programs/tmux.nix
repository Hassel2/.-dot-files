{ pkgs, ... }:
let 
  thm_bg = "#2d353b";
  thm_bg1 = "#343f44";
  thm_bg2 = "3d484d";
  thm_fg = "#a7c080";
  thm_red = "#e67e80";
  thm_green = "#a7c080";
  thm_blue = "#7fbbb3";
in
{
  programs.tmux = {

    plugins = with pkgs.tmuxPlugins; [
      tilish
    ];

    enable = true;
    keyMode = "vi";
    newSession = true;
    escapeTime = 0;
    prefix = "M-c";
    baseIndex = 1;
    extraConfig = ''
      set -g @tilish-navigator 'on'

      # Start windows and panes at 1, not 0
      set -g base-index 1
      setw -g pane-base-index 1

      set-option -g status-position top
      set-option -g status "on"
      # default statusbar color
      set-option -g status-style bg=${thm_bg},fg=${thm_fg} # bg=bg1, fg=fg1
      # default window title colors
      set-window-option -g window-status-style bg=${thm_green},fg=${thm_bg} # bg=yellow, fg=bg1
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
      set-option -g display-panes-active-colour '${thm_fg}' #fg2
      set-option -g display-panes-colour '${thm_bg}' #bg1
      # clock
      set-window-option -g clock-mode-colour '${thm_blue}' #blue
      # bell
      set-window-option -g window-status-bell-style bg=${thm_red},fg=${thm_bg} # bg=red, fg=bg
      # Theme settings mixed with colors (unfortunately, but there is no cleaner way)
      set-option -g status-justify "left"
      set-option -g status-left-style none
      set-option -g status-left-length "80"
      set-option -g status-right-style none
      set-option -g status-right-length "80"
      set-window-option -g window-status-separator ""

      set-option -g status-left "#[bg=${thm_fg},fg=${thm_bg}] #S #[bg=${thm_bg},fg=${thm_fg},nobold,noitalics,nounderscore]"
      set-option -g status-right "#[bg=${thm_bg},fg=${thm_bg1} nobold, nounderscore, noitalics]#[bg=${thm_bg1},fg=${thm_fg}] %Y-%m-%d  %H:%M #[bg=${thm_bg1},fg=${thm_bg2},nobold,noitalics,nounderscore]#[bg=${thm_fg},fg=${thm_bg}] #h "

      set-window-option -g window-status-current-format "#[bg=${thm_green},fg=${thm_bg},nobold,noitalics,nounderscore]#[bg=${thm_green},fg=${thm_bg}] #I #[bg=${thm_green},fg=${thm_bg},bold] #W#{?window_zoomed_flag,*Z,} #[bg=${thm_bg},fg=${thm_green},nobold,noitalics,nounderscore]"
      set-window-option -g window-status-format "#[bg=${thm_bg1},fg=${thm_bg},noitalics]#[bg=${thm_bg1},fg=${thm_fg}] #I #[bg=${thm_bg1},fg=${thm_fg}] #W #[bg=${thm_bg},fg=${thm_bg1},noitalics]"
    '';
  };
}
