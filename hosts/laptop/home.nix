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
        corrupter
        amdctl
        amdgpu_top

        # gaming
        hmcl
        bottles
        minetest
        xonotic
        mangohud
        protonup-qt
        gamemode

        # desktop
        anytype
        gimp
        wpsoffice
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
        flameshot
        satty
        winbox
        chromium
        kanshi
    ];

}
