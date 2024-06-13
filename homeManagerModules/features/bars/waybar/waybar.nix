{ config, lib, ... }:

with lib;

let
  cfg = config.waybarModule;
in
{
  options.waybarModule = {
      enable = lib.mkEnableOption "Enable Waybar";
  };

  config = mkIf cfg.enable {
    programs.waybar.enable = true;
  };
}
