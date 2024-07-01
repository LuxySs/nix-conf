{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.settings.pavucontrol;
in
{
  options.settings.pavucontrol.enable = lib.mkEnableOption "pavucontrol";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.pavucontrol ]; };
}
