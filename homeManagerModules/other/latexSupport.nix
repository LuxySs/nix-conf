{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.latexSupport;
in
{
  options.settings.latexSupport.enable = lib.mkEnableOption "latex support";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.texlive.combined.scheme-medium ]; };
}
