{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.mediaViewer.mpv;
in
{
  options.settings.mediaViewer.mpv.enable = lib.mkEnableOption "mpv media viewer";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.mpv ]; };
}
