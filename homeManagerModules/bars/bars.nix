{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.bars;
in
{
  imports = [
    ./waybar/waybar.nix
  ];

  config = mkIf cfg.enable {
    waybarModule.enable = cfg.enableWaybar;
  };
}
