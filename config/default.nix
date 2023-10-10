{ config, ... }:
let
  cfgPath = ".config";
in
{
  home = {
    file."${cfgPath}/nvim" = {
      source = ./nvim;
      recursive = true;
    };

    file."${cfgPath}/hypr" = {
      source = ./hypr;
      recursive = true;
    };

    file."${cfgPath}/waybar" = {
      source = ./waybar;
      recursive = true;
    };

    file."${cfgPath}/emacs" = {
      source = ./emacs;
      recursive = true;
    };
  };
}
