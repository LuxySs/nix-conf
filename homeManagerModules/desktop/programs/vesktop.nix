{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.vesktop;
in
{
  options.settings.vesktop.enable = lib.mkEnableOption "vesktop";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.vesktop ]; };
}
