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
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "hibernate";
          action = "sleep 1; systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
        }
        {
          label = "logout";
          action = "sleep 1; hyprctl dispatch exit";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "sleep 1; systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "suspend";
          action = "sleep 1; systemctl suspend";
          text = "Suspend";
          keybind = "u";
        }
        {
          label = "reboot";
          action = "sleep 1; systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];
    };
  };
}
