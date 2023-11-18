{ config, lib, pkgs, user, ... }:

{

  imports =
    (import ../modules/programs) ++
    (import ../modules/services) ++
    (import ../modules/windowManagers);

  home = {

    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";

    packages = with pkgs; [
        # cli
        btop
        bc
        eza
        socat
        grim
        slurp
        ripgrep
        gnupg
        sshpass
        dig
        wireguard-tools

        # desktop
        libnotify
        swaynotificationcenter
        wl-clipboard
        swappy
        rofi-wayland
        swaybg
        distrobox

        # programming
        lazygit
        ## language servers
        ### Java
        jdt-language-server
        ### Yaml
        yaml-language-server
        ansible-language-server
        ### Golang
        gopls
        ### PHP 
        nodePackages.intelephense
    ];

  };
}
