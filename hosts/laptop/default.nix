{ pkgs, lib, user, ... }:
{

  imports = [

    ./hardware-configuration.nix
    ./xdg.nix
    ./nvidia.nix

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

  virtualisation = { 
    docker.enable = true;
    libvirtd.enable = true;
  };
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
  programs.virt-manager.enable = true;

  security.polkit.enable = true;

  services = {
    xserver.desktopManager.xfce.enable = true;
    logind.lidSwitchExternalPower = "ignore";
  };

}

