{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib; 
      system = "x86_64-linux";
    in
    {
    nixosConfigurations = {
      nixTesMorts = lib.nixosSystem {
        system = system;
        modules = [ ./configuration.nix ];
      };
    };
    # homeConfiguration = {
    #   nixTesMorts = lib.nixosSystem {
    #     system = system;
    #     modules = [ ./configuration.nix ];
    #   };
    # };

  };
}
