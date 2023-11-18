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
    waydroid.enable = true;
  };
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  security.polkit.enable = true;

  services.xserver.desktopManager.xfce.enable = true;

}

