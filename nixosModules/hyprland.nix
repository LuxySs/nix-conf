{
  inputs,
  lib,
  pkgs,
  settings,
  ...
}:

let
  cfg.enable = builtins.elem "hyprland" settings.wm;
in
{
  config = lib.mkIf (cfg.enable) {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      xwayland.enable = true;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
