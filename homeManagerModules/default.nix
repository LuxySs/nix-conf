{ config, pkgs, ... }: {

  imports = [
    ./bars/default.nix
    ./editors/default.nix
    ./launchers/default.nix
    ./shells/default.nix
    ./terminals/default.nix
    ./multiplexers/default.nix
  ];
}
