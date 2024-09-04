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

    ags.url = "github:Aylur/ags";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    webcord.url = "github:fufexan/webcord-flake";

    nixCats.url = "github:BirdeeHub/nixCats-nvim?dir=nix";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
      customLib = import ./lib { inherit (nixpkgs) lib; };
      lib = nixpkgs.lib.extend (self: super: customLib);
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      nixosConfigurations = {
        dishwasher = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs lib;
          };
          modules = [ ./hosts/dishwasher ];
        };
        cookingPlate = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs lib;
          };
          modules = [ ./hosts/cookingPlate ];
        };
      };
    };
}
