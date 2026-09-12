{
  description = "all migthy main flake !{0o0}!";
  inputs = {

    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };

    flatpaks = {
      nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    nfsm-flake = {
      url = "github:gvolpe/nfsm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      nvf,
      flatpaks,
      ...
    }:

    let
      system = "x86_64-linux";
      nixosSystem = nixpkgs.lib.nixosSystem;
      users = builtins.map (name: import (./users/${name})) (
        builtins.attrNames (builtins.readDir ./users)
      );
      hardware = builtins.map (name: import (./hardware/${name})) (
        builtins.attrNames (builtins.readDir ./hardware)
      );
      flatpaks = builtins.map (name: import (./flatpaks/${name})) (
        builtins.attrNames (builtins.readDir ./flatpaks)
      );

    in

    {
      nixosConfigurations = {
        main = nixosSystem {
          inherit system;
          modules = [
            nvf.nixosModules.default
            flatpaks.nixosModules.nix-flatpak
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.mads = ./home/home.nix;

                extraSpecialArgs = {
                  inherit system;
                  inherit inputs;
                };

                sharedModules = [
                  plasma-manager.homeModules.plasma-manager
                ];
              };
            }

            ./boot.nix

            ./system/environment-variables.nix
            ./system/system-modules.nix
            ./system/system-settings.nix
            ./system/system-args.nix

            ./nix/nix.nix
          ]
          ++ users
          ++ hardware
          ++ flatpaks;
        };
      };
    };
}
