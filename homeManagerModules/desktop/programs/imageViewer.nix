{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.settings.imageViewer.loupe;
in
{
  options.settings.imageViewer.loupe.enable = lib.mkEnableOption "loupe image viewer";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.loupe ]; };
}
