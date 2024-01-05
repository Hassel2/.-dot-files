{ pkgs, ... }:

{

  home.packages = with pkgs;
    [
        # cli
        zip
        unzip
        unrar
        cached-nix-shell
        pass
        assh
        fet-sh

        # gaming
        hmcl
        cataclysm-dda
        bottles
        minetest
        xonotic

        # desktop
        swaylock-effects
        anytype
        gimp
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
        feh
    ];

}
