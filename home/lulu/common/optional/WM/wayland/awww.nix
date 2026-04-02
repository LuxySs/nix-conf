{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.awww;
in
{
  options.settings.wm.awww.enable = lib.mkEnableOption "awww";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ awww ]; };
}
