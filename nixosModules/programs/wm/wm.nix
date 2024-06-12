{ lib, pkgs, config, ... }:
with lib;                      
let
  cfg = config.windowManagers;
in {
  imports = [ ./hyprland/hyprland.nix ];


  options.windowManagers = {
    enable = mkEnableOption "enable WM module";
    enableHyprland = mkEnableOption "enable Hyprland module";
  };

  config = mkIf cfg.enable {
    hyprlandModule.enable = cfg.enableHyprland;
  };
}
