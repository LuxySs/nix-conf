{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.hyprlandModule;
in
{
  options.hyprlandModule = {
      enable = lib.mkEnableOption "Enable Hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = [
          "$mod, RETURN, exec, foot"
        ];
      };
    };
  };
}

