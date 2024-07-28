{
  config,
  lib,
  myNixos,
  pkgs,
  ...
}:

let
  cfg = config.settings.hyprland;
in
{
  options.settings.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf (cfg.enable) {
    programs.hyprland = {
      enable = if builtins.elem "firefox" myNixos.wm then true else lib.mkEnableOption "hyprland";
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
