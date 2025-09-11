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

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

      forAllSystems =
        function:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system:
          function (
            import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            }
          )
        );

    in
    {
      packages = forAllSystems (pkgs: import ./pkgs { inherit pkgs; });

      formatter = forAllSystems (pkgs: pkgs.nixfmt-tree);

      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        cooking-plate = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs lib; };
          modules = [ ./hosts/cooking-plate ];
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
