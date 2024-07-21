{ config, lib, ... }:

let
  cfg = config.settings.wm.hypridle;
in
{
  options.settings.wm.hypridle = {
    enable = lib.mkEnableOption "hypridle";
    timeout = {
      lock = lib.mkIntOption 60 "hypridle lock timeout";
      dpms = lib.mkIntOption 120 "hypridle dpms (black screen) timeout";
    };
  };

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
            timeout = cfg.timeout.lock;
            on-timeout = "hyprlock";
          }
          {
            timeout = cfg.timeout.dpms;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
