{ pkgs, lib, user, ... }:

{

  imports = [

    ./hardware-configuration.nix

  ];

  boot = {

    loader = {

      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;

    };

  };

}

