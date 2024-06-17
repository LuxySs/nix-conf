{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    animation = {
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];
      animation = "windows, 1, 6, wind, slide";
   };
  };
 }
