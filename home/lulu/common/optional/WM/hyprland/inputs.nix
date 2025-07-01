{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "intl";
      kb_options = "caps:swapescape";

      accel_profile = "flat";
      repeat_delay = 300;
      repeat_rate = 50;
    };

    device = [
      {
        name = "syna8018:00-06cb:ce67-touchpad";
        sensitivity = 1;
      }
    ];
  };
}
