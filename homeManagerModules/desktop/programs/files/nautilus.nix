{ lib,  config, pkgs, ... }:

{
  options.settings.files.nautilus.enable = lib.mkEnableOption "nautilus";

  config = lib.mkIf (config.settings.files.nautilus.enable) {
    home.packages = with pkgs; [
      gnome.adwaita-icon-theme 
      gnome.nautilus 
    ];
  };
}
