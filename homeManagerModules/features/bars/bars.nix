{ config, lib, ... }:

with lib;

let
  cfg = config.bars;
in {
  imports = [ ./waybar/waybar.nix ];

  options.bars = {
    enable = mkEnableOption "Enable the bars module";
    enableWaybar = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the Waybar module";
    };
  };

  config = mkIf cfg.enable {
    waybarModule.enable = cfg.enableWaybar;
  };
}

