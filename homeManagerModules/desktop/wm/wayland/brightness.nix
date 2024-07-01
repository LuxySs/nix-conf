{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.brightness;
in
{
  options.settings.wm.brightness.enable = lib.mkDisableOption "brightness";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ brightnessctl ]; };
}
