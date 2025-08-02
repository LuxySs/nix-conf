{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,qt6ct"
    ];

    cursor.no_hardware_cursors = true;
    xwayland.force_zero_scaling = true;

    exec-once = "ags";

    # automatically configure monitors based on the monitors.nix module
    monitor = map (
      m:
      let
        resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
        position = "${toString m.x}x${toString m.y}";
      in
      "${m.name},${if m.enabled then "${resolution},${position},1" else "disable"}"
    ) (config.monitors);
  };
}
