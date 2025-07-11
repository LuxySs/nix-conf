{ lib, config, ... }:

let
  cfg = config.settings.wm.hyprland;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 7;
      border_size = 2;
      layout = "dwindle";

      # this allows for smart gaps (no gaps when one single window)
      workspace = lib.mkIf cfg.smartGapsEnabled [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
      ];
    };
  };
}
