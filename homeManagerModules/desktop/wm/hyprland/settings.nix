{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    # desktop_hyprland.conf

    env = [
      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,qt6ct"
    ];

    monitor = [
      "DP-3,3440x1440@99.98Hz,0x0,1"
      "Unknown-1,disable" # disable ghost monitor du to nvidia fuckery
    ];

    exec-once = "swww-daemon";

  };
}