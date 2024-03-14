{ pkgs, lib, user, ... }:

{
    security.rtkit.enable = true;
    xdg = {
        portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-hyprland
            ];
        };
    };

    xdg.portal.wlr.settings = {
        screencast = {
            output_name = "eDP-1";
            max_fps = 60;
            chooser_type = "simple";
            chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";		
        };
    };
}
