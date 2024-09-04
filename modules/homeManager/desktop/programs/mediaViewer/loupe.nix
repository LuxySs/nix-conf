{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.mediaViewer.loupe;
in
{
  options.settings.mediaViewer.loupe.enable = lib.mkEnableOption "loupe media viewer";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.loupe ]; };
}
