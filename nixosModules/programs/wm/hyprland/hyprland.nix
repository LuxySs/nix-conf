{ lib, pkgs, config, ... }:
with lib;                      
let
  cfg = config.hyprlandModule;
in {
  options.hyprlandModule = {
    enable = mkEnableOption "enable Hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland.enable = true;
  };
}
