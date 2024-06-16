{ config, pkgs, lib, ... }:

{
  options.settings.wm.wlogout.enable = lib.mkEnableOption "wlogout";

  config = lib.mkIf (config.settings.wm.wlogout.enable) {
    programs.wlogout = {
      enable = true;
      package = pkgs.wlogout;
      layout = [
        {
          label = "lock";
          # action = "sleep 1; swaylock";
          action = "sleep 1; hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
        }
        {
          label = "logout";
          # The one with hyprctl causes problems with running programs, such as ags.
          action = "loginctl terminate-user $USER";
          # action = "hyprctl dispatch exit";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "suspend";
          # action = "sleep 1; swaylock & systemctl suspend";
          action = "sleep 1; hyprlock & systemctl suspend";
          text = "Suspend";
          keybind = "u";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];
      # style =
    };
  };
}
