{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.man-pages;
in
{
  options.settings.man-pages.enable = lib.mkDisableOption "man-pages";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      man-pages
      man-pages-posix
    ];
  };
}
