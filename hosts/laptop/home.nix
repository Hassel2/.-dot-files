{ pkgs, ... }:

{

  home.packages = with pkgs;
    [
        # emacs
        emacs

        # cli
        zip
        unzip
        cached-nix-shell
        pass
        assh
        fet-sh

        # gaming
        hmcl
        cataclysm-dda

        # desktop
        gimp
        libreoffice-fresh
        pinentry-gtk2
        xdragon
        xwayland
        pavucontrol
        light
        polkit
        libsForQt5.polkit-kde-agent
        opera
        vivaldi
        telegram-desktop
        webcord
    ];

}
