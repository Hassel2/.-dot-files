{ pkgs, lib, user, ... }:

{

  imports = [

    ./hardware-configuration.nix
    ./xdg.nix

  ];

  boot = {
    loader = {
      grub = { 
          enable = true;
          device = "nodev";
          efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  virtualisation.docker.enable = true;


}

