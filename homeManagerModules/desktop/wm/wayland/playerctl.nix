{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.playerctl;
in
{
  options.settings.wm.playerctl.enable = lib.mkDisableOption "playerctld";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.playerctl ]; };
}
