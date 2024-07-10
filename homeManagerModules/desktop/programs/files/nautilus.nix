{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.settings.files.nautilus;
in
{
  options.settings.files.nautilus.enable = lib.mkEnableOption "nautilus";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      adwaita-icon-theme
      nautilus
    ];
  };
}
