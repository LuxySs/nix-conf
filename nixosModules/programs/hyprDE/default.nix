{ lib, config, ... }:

with lib;                      

let
  cfg = config.hyprDE;
in 
{
  imports = [ 
    ./hyprland.nix 
  ];

  options.hyprDE = {
    enable = mkEnableOption "enable WM module";
    enableHyprland = mkEnableOption "enable Hyprland module";
  };

  config = mkIf cfg.enable {
    hyprlandModule.enable = cfg.enableHyprland;
  };
}
