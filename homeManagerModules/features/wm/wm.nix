{ config, lib, ... }:

with lib;

let
  cfg = config.windowManagers;
in
{
  imports = [
    ./hyprland/hyprland.nix
  ];

  options.windowManagers = {
    enable = mkEnableOption "enable WM module";
    enableHyprland = mkEnableOption "enable hyprland WM";
  };

  config = mkIf cfg.enable {
    hyprlandModule.enable = cfg.enableHyprland;
  };
}

