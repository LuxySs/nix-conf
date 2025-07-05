{ config, ... }:

let
  cfg = config.settings.wm.hyprland;

  speed = "4";
  slide = "slidevert";
in
{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = cfg.animationsEnabled;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];

      animation = [
        "windows, 1, 4, wind, slide"
        "windowsIn, 1, 4, winIn, slide"
        "windowsOut, 1, 4, winOut, slide"
        "windowsMove, 1, 4, wind, slide"
        "border, 1, ${speed}, default"
        "borderangle, 1, ${speed}, default"
        "fade, 1, ${speed}, default"
        "workspaces, 1, ${speed}, default"
        "specialWorkspace, 1, ${speed}, default, ${slide}"
      ];
    };
  };
}
