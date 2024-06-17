{ lib, config, inputs, pkgs, ... }:

{
  options.settings.hyprland.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
    description = "hyprland";
  };

  config = lib.mkIf (config.settings.hyprland.enable)  {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      xwayland.enable = true;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    hardware.opengl = {
      enable = true;
      driSupport = true;
   };

    xdg.portal = { 
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    }; 
  };
}