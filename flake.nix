{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        NixTesMorts = nixpkgs.lib.nixosSystem {
          specialArgs = { 
            inherit inputs; 
          };
          
          modules = [ 
            ({ config, pkgs, ... }: { networking.hostName = "NixTesMorts" ; })
            ./hosts/desktop/configuration.nix
            ./nixosModules
            inputs.stylix.nixosModules.stylix
          ];
        };
      };

      homeConfigurations = {
        lulu = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}

