# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, user, ... }:

{

  imports = [
    ../modules/programs/fish.nix
    ../modules/programs/gnupg.nix
    ../modules/programs/steam.nix
    ../modules/services/pipewire.nix
  ];

  users.users.${user} = {

    isNormalUser = true;
    extraGroups = [ "qemu-libvirtd" "libvirtd"
      "networkmanager" "wheel" "docker" "video" ];
    shell = pkgs.fish;
    packages = with pkgs; [
        (st.overrideAttrs (oldAttrs: rec {
            src = fetchTarball {
                url = "https://github.com/Hassel2/st-custom/archive/main.tar.gz";
                sha256 = "0qd59z61hwnn7kxkn9mrdpipaybgls89kyx356jlzflq9sglb06z";
            };
            buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
        }))
    ];

  };

  fonts.packages = with pkgs; [

    font-awesome
    corefonts
    iosevka
    noto-fonts-emoji

  ];

  environment = {

    systemPackages = with pkgs; [

      nvim-pkg
      git
      killall
      wget
      jq

    ];

  };

  networking = {

    hostName = "nixos";
    networkmanager.enable = true;
    search = [ "web-bee.loc" "svc.cluster.local" "betiz.loc" ];
    firewall.checkReversePath = false;

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
