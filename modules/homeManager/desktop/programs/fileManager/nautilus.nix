{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.settings.fileManager.nautilus;
in
{
  options.settings.fileManager.nautilus.enable = lib.mkEnableOption "nautilus";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      adwaita-icon-theme
      nautilus
    ];
  };
}
