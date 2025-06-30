{
  description = "who cares ?";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:aylur/ags/v1";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    webcord.url = "github:fufexan/webcord-flake";

    myNixCats.url = "github:LuxySs/nixcats-conf";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      customLib = import ./lib { inherit (nixpkgs) lib; };
      lib = nixpkgs.lib.extend (self: super: customLib // home-manager.lib);

      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        cooking-plate = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs lib; };
          modules = [ ./hosts/cooking_plate ];
        };

        dishwasher = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs lib; };
          modules = [ ./hosts/dishwasher ];
        };
      };

      homeConfigurations = {
        "lulu@archlinux" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs outputs lib; };
          modules = [ ./home/lulu/archlinux.nix ];
        };
      };
    };
}
