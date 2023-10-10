{ pkgs, lib, user, ... }:

{

  imports = [

    ./hardware-configuration.nix

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

}

