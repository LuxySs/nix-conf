{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.swww;
in
{
  options.settings.wm.swww.enable = lib.mkEnableOption "swww";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ swww ]; };
}
