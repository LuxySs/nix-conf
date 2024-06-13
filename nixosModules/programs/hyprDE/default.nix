{ lib, config, ... }:

with lib;                      

let
  cfg = config.hyprDE;
in 
{
  imports = [ 
    ./hyprland.nix 
    ./swww.nix 
  ];

  options.hyprDE = {
    enable = mkEnableOption "enable WM module";
    enableHyprland = mkEnableOption "enable Hyprland module";
    enableSwww = mkEnableOption "enable swww module";
  };

  config = mkIf cfg.enable {
    hyprlandModule.enable = cfg.enableHyprland;
    swwwModule.enable = cfg.enableSwww;
  };
}
