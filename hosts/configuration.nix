# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, user, ... }:

{

  imports = [
    ../modules/programs/fish.nix
    ../modules/programs/hyprland.nix
  ];

  users.users.${user} = {

    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;

  };

  fonts.fonts = with pkgs; [

    font-awesome
    corefonts
    iosevka
    noto-fonts-emoji

  ];

  environment = {

    systemPackages = with pkgs; [

      neovim
      git
      killall
      wget

    ];

  };

  networking = {

    hostName = "vm";
    networkmanager.enable = true;

  };

  services = {
    xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
      };
    };
  };

  time.timeZone = "Europe/Moscow";

  i18n = {

    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {

      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";

    };

  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.05";

}
