{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.latex-support;
in
{
  options.settings.latex-support.enable = lib.mkEnableOption "latex support (texlive)";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.texlive.combined.scheme-medium ]; };
}
