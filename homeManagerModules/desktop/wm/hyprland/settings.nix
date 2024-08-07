{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,qt6ct"
      "WLR_NO_HARDWARE_CURSORS=1"
    ];

    monitor = [
      "DP-1,3440x1440@99.98,0x0,1"
      "Unknown-1,disable" # disable ghost monitor du to nvidia fuckery
    ];

    exec-once = "swww-daemon & ags";

    xwayland = {
      force_zero_scaling = true;
    };
  };
}
