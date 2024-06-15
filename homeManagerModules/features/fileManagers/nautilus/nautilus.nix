{ lib,  config, pkgs, ... }:

with lib;                      

let
  cfg = config.nautilusModule;
in
{
  options.nautilusModule = {
    enable = mkEnableOption "enable nautilus";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome.adwaita-icon-theme 
      gnome.nautilus 
    ];
  };
}
