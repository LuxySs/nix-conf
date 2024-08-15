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
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      customLib = import ./lib { inherit (pkgs) lib; };
      lib = pkgs.lib.extend (self: super: customLib);
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs lib;
            settings = import ./hosts/desktop/settings.nix;
          };
          modules = [ ./hosts/desktop/configuration.nix ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs lib;
            settings = import ./hosts/laptop/settings.nix;
          };
          modules = [ ./hosts/laptop/configuration.nix ];
        };
      };

      # this one is currently unmaintained
      homeConfigurations = {
        "lulu" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs lib;
          };
          modules = [ ./lulu/home.nix ];
        };
      };
    };
}
