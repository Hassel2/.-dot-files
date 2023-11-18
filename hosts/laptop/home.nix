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
        bottles
        minetest
        jdk17

        # desktop
        sassc
        swaylock-effects
        anytype
        gimp
        libreoffice-fresh
        wpsoffice
        pinentry-gtk2
        xdragon
        xwayland
        pavucontrol
        light
        polkit
        pantheon.pantheon-agent-polkit
        vivaldi
        telegram-desktop
        webcord
    ];

}
