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

  options.shells = {
    enable = mkEnableOption "enable shells module";
    enableBash = mkEnableOption "enable bash module";
    enableFish = mkEnableOption "enable fish module";
  };

  config = mkIf cfg.enable {
    bashModule.enable = cfg.enableBash;
    fishModule.enable = cfg.enableFish;
  };
}
