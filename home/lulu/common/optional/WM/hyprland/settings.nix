{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,qt6ct"
      "WLR_NO_HARDWARE_CURSORS=1"
    ];

    # automatically configure monitors based on the monitors.nix module
    monitor = map (
      m:
      let
        resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
        position = "${toString m.x}x${toString m.y}";
      in
      "${m.name},${if m.enabled then "${resolution},${position},1" else "disable"}"
    ) (config.monitors);

    exec-once = "swww-daemon & ags";

    xwayland = {
      force_zero_scaling = true;
    };
  };
}
