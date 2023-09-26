{ pkgs, ... }:

{

  home.packages = with pkgs;
    [
        assh
        telegram-desktop
        fet-sh
        opera
        pass
        polkit
        libsForQt5.polkit-kde-agent
        light
        pavucontrol
        cached-nix-shell
    ];

}
