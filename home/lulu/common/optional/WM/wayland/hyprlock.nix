{ config, lib, ... }:

let
  cfg = config.settings.wm.hyprlock;
in
{
  options.settings.wm.hyprlock.enable = lib.mkEnableOption "hyprlock";

  config = lib.mkIf (cfg.enable) {
    programs.hyprlock = {
      enable = true;

      settings = {
        # BACKGROUND
        background = {
          path = "${./../../../../../../wallpapers/wallpaper.png}";
          blur_passes = 3;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        };

        general = {
          no_fade_in = false;
          grace = 0;
          disable_loading_bar = true;
        };

        input-field = {
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.5)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          placeholder_text = ''<i><span foreground="##cdd6f4">Input Password...</span></i>'';
          hide_input = false;
          position = "0, -120";
          halign = "center";
          valign = "center";
        };

        label = [
          # TIME
          {
            text = ''cmd[update:1000] echo "$(date +"%-I:%M%p")"'';
            font_size = 120;
            position = "0, -300";
            halign = "center";
            valign = "top";
          }

          # USER
          {
            text = "Hi there, $USER";
            font_size = 25;
            position = "0, -40";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
