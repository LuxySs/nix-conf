{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.hyprlandModule;
in
{
  wayland.windowManager.hyprland.settings = {
     
    decoration = {
      # rounding = 1#
      blur {
          enabled = true;
          size = "6";
          passes = "3";
          new_optimizations = "on";
          ignore_opacity = "true";
          xray = "true";
          blurls = "waybar";
      };
      active_opacity = "1.0";
      inactive_opacity = "1.0";
      fullscreen_opacity = "1.0";
  
      drop_shadow = "true";
      shadow_range = "30";
      shadow_render_power = "3";
      "col.shadow = 0x66000000";
    };
  };
}
