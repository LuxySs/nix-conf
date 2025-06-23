{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.mpv;
in
{
  options.settings.mpv.enable = lib.mkEnableOption "mpv media viewer";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.mpv ]; };
}
