{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.launchers;
in
{
  imports = [
    ./fuzzel/fuzzel.nix
  ];

  config = mkIf cfg.enable {
    fuzzelModule.enable = cfg.enableFuzzel;
  };
}
