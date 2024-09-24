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

    techmino = {
      url = "github:Hassel2/techmino-flake";
    };

    nvim-nix = {
      url = "github:Hassel2/nvim-nix";
    };

    hycov = {
      url = "github:DreamMaoMao/hycov";
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
