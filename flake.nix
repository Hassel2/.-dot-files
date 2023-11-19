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

    nvim-nix = {
      url = "github:Hassel2/nvim-nix";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, nvim-nix, ... }:
    let

      user = "anton";
      location = "$HOME/dotfiles";

    in {

      nixosConfigurations = import ./hosts {

        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager user location;

      };

    };
}
