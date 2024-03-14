{ config, ... }:
let
  cfgPath = ".config";
in
{
  home = {
    file = {
      "${cfgPath}/waybar" = {
        source = ./waybar;
        recursive = true;
      };
      "${cfgPath}/kanshi" = {
        enable = true;
        source = ./kanshi;
        recursive = true;
        target = ".config/kanshi";
        };
    };
  };
}
