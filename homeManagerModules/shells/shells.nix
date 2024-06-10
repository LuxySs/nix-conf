{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.shells;
in
{
  imports = [
    ./bash/bash.nix
    ./fish/fish.nix
  ];

  config = mkIf cfg.enable {
    bashModule.enable = cfg.enableBash;
    fishModule.enable = cfg.enableFish;
  };
}
