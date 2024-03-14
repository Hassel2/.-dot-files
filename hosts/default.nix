{ lib, inputs, nixpkgs, home-manager, user, location }:
let

  system = "x86_64-linux";

  pkgs = import nixpkgs {

    inherit system;
    config.allowUnfree = true;
    overlays = [
      inputs.nvim-nix.overlays.default
    ];

  };

  lib = nixpkgs.lib;

in {

  vm = lib.nixosSystem {
    inherit system;

    specialArgs = {

      inherit inputs pkgs system user location;
      host = {

        hostName = "vm";

      };
    };
    modules = [

      ./vm
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {

          inherit pkgs user inputs;
          host = {

            hostName = "vm";

          };
        };
        home-manager.users.${user} = {

          imports = [

            ./home.nix
            ./vm/home.nix
            ../config

          ];
        };
      }
    ];
  };

  laptop = lib.nixosSystem {

    inherit system;
    specialArgs = {

      inherit inputs pkgs system user location;
      host = {

        hostName = "nixos";

      };

    };
    modules = [

      ./laptop
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {

          inherit pkgs user inputs;
          host = {

            hostName = "nixos";

          };
        };
        home-manager.users.${user} = {

          imports = [

            ./home.nix
            ./laptop/home.nix
            ../config

          ];
        };
      }
    ];
  };
}
