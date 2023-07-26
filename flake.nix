{
  description = "Frendship ended with Artix";

  inputs = {

    nixpkgs = {

      url = "github:nixos/nixpkgs/nixos-unstable";

    };

    home-manager = {

      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };

    Hyprland = {

      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";

    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, Hyprland, ... }:
    let

      user = "anton";
      location = "$HOME/dotfiles";

    in {

      nixosConfigurations = import ./hosts {

        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager Hyprland user location;

      };

    };
}