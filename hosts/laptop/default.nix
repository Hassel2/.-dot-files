{ pkgs, lib, user, ... }:
{

  imports = [

    ./hardware-configuration.nix
    ./xdg.nix
    ./nvidia.nix
    ./pci-passthrough.nix

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

  systemd.enableUnifiedCgroupHierarchy = false;
  virtualisation = { 
    docker = {
      enable = true;
      enableOnBoot = true;
      enableNvidia = true;
    };
    waydroid.enable = true;
  };

  security.polkit.enable = true;

  services = {
    xserver.desktopManager.xfce.enable = true;
    logind.lidSwitchExternalPower = "ignore";
  };

}

