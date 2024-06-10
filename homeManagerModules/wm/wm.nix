{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.windowManagers;
in
{
  imports = [
    ./hyprland/hyprland.nix
  ];

  config = mkIf cfg.enable {
    hyprlandModule.enable = cfg.enableHyprland;
  };
}

