{ config, lib, ... }:

let
  cfg = config.settings.wm.hypridle;
in
{
  options.settings.wm.hypridle.enable = lib.mkEnableOption "hypridle";

  config = lib.mkIf (cfg.enable) {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
          lock_cmd = "pidof hyprlock || hyprlock";
        };

        listener = [
          {
            timeout = 30;
            on-timeout = "hyprlock";
          }
          {
            timeout = 60;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
