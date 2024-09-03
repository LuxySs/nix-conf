{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.hyprland;
in
{
  options.settings.hyprland.enable = lib.mkEnableOption "Hyprland WM";

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
      extraPortals = [ ];
    };
  };
}
