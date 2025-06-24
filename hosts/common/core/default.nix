{ outputs, ... }:

{
  imports = [
    ./console.nix
    ./experimental_features.nix
    ./locale.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];

    config.allowUnfree = true;
  };
}
