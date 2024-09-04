{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.pwvucontrol;
in
{
  options.settings.pwvucontrol.enable = lib.mkEnableOption "pwvucontrol";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.pwvucontrol ]; };
}
