{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      hostName = "NixTesMorts";
      lib = nixpkgs.lib; 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        ${hostName} = lib.nixosSystem {
          inherit system;
          modules = [ 
            ({ config, pkgs, ... }: {
              networking.hostName = hostName;
            })
            ./hosts/desktop/configuration.nix
            ./nixosModules
          ];
        };
      };

      homeConfigurations = {
        lulu = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}

