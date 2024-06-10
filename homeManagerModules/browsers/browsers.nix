{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.browsers;
in
{
  imports = [
    ./firefox/firefox.nix
  ];

  config = mkIf cfg.enable {
    firefoxModule.enable = cfg.enableFirefox;
  };
}

