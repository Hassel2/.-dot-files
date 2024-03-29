{ config, lib, pkgs, user, inputs, ... }:

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
        k9s
        fzf
        vhs
        ncdu

        # desktop
        libnotify
        swaynotificationcenter
        wl-clipboard
        swappy
        rofi-wayland
        swaybg
        distrobox
        inputs.techmino.packages.x86_64-linux.default
        anydesk

        # programming
        lazygit
    ];

  };
}
