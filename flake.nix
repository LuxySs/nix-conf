{
  description = "who cares ?";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix.url = "github:danth/stylix";

    ags.url = "github:aylur/ags/v1";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    webcord.url = "github:fufexan/webcord-flake";

    myNixCats.url = "github:LuxySs/nixcats-conf";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forEachSystem = nixpkgs.lib.genAttrs systems;

      customLib = import ./lib { inherit (nixpkgs) lib; };
      lib = nixpkgs.lib.extend (self: super: customLib // home-manager.lib);

      # Generate pkgs for each supported system
      pkgsForSystem = forEachSystem (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ ];
        }
      );
    in
    {
      formatter = forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      nixosConfigurations =
        let
          specialArgs = {
            inherit inputs lib pkgsForSystem;
          };
        in
        {
          dishwasher = nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = [ ./hosts/dishwasher ];
          };
          cooking-plate = nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = [ ./hosts/cooking-plate ];
          };
        };
      homeConfigurations = {
        "lulu@archlinux" =
          let
            system = "x86_64-linux";
          in
          home-manager.lib.homeManagerConfiguration {
            pkgs = pkgsForSystem.${system};
            extraSpecialArgs = {
              inherit inputs lib;
            };
            modules = [
              ./home/lulu/archlinux.nix
            ];
          };
      };
    };
}
