{ config, lib, pkgs, user, ... }:

{

  imports =
    (import ../modules/programs) ++
    (import ../modules/services);

  home = {

    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";

    packages = with pkgs; [
        btop
        bc
        eza
        rofi-wayland
        swaybg
        socat
        swappy
        grim
        slurp
        wl-clipboard
        libnotify
        swaynotificationcenter
        ripgrep
        gnupg
        pinentry
    ];

  };
}
