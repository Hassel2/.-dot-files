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
        exa
        foot
    ];

  };
}
