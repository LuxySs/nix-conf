{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.bars;
in {
  imports = [ ./waybar/waybar.nix ];

  options.bars = {
    enable = mkEnableOption "enable bars module";
    enableWaybar = mkEnableOption "enable waybar module";
  };

  config = mkIf cfg.enable {
    waybarModule.enable = cfg.enableWaybar;
  };
}
