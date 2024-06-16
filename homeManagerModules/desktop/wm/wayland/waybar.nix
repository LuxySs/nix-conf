{ config, lib, ... }:

{
  options.settings.wm.waybar.enable = lib.mkEnableOption "waybar";

  config = lib.mkIf (config.settings.wm.waybar.enable) {
    programs.waybar.enable = true;
  };
}
