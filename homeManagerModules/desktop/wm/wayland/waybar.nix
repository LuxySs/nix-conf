{ config, lib, ... }:

let
  cfg = config.settings.wm.waybar;
in
{
  options.settings.wm.waybar.enable = lib.mkEnableOption "waybar";

  config = lib.mkIf (cfg.enable) { programs.waybar.enable = true; };
}
