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
    { nixpkgs, home-manager, ... }@inputs:
    let
      customLib = import ./lib { inherit (nixpkgs) lib; };
      lib = nixpkgs.lib.extend (self: super: customLib // home-manager.lib);
    in
    {
      nixosConfigurations = {
        cooking_plate = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs lib;
          };
          modules = [
            ./hosts/cooking_plate
            { nixpkgs.hostPlatform = "x86_64-linux"; }
          ];
        };

        dishwasher = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs lib;
          };
          modules = [
            ./hosts/dishwasher
            { nixpkgs.hostPlatform = "x86_64-linux"; }
          ];
        };
      };

      homeConfigurations = {
        "lulu@archlinux" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = {
            inherit inputs lib;
          };
          modules = [
            ./home/lulu/archlinux.nix
            { nixpkgs.hostPlatform = "x86_64-linux"; }
          ];
        };
      };
    };
}
