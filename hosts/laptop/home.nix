{ pkgs, system, ... }:
let
    teleport_pkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/4dd072b68c5c146981b61634b58aa13a8f2d7ba2.tar.gz";
        sha256 = "0513misr8lbrmrd0xrvipq0ax9z890c3hicvbwnhn9kfvhzbpmw5";
    }) { 
        inherit system; 
        config.allowUnfree = true;
    };
in
{
  gtk.cursorTheme.package = pkgs.google-cursor;
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
        rpPPPoE
        kubectl

        # gaming
        hmcl
        bottles
        minetest
        xonotic
        mangohud
        protonup-qt
        gamemode
        fallout-ce

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
        zoom-us
        mattermost-desktop
    ] ++ [ 
        teleport_pkgs.teleport_12
    ];
}
