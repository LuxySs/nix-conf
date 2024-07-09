{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "intl";
      kb_options = "caps:swapescape";

      follow_mouse = 1;

      touchpad = {
        natural_scroll = "no";
      };

      sensitivity = -0.4;
      accel_profile = "flat";

      repeat_delay = 300;
      repeat_rate = 50;
    };

    device = [
      {
        name = "syna8018:00-06cb:ce67-touchpad";
        sensitivity = 0;
      }
    ];
  };
}
