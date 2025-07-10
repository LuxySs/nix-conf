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
  options.settings.hyprland = {
    enable = lib.mkEnableOption "Hyprland WM";
    useFlake = lib.mkDisableOption "use Hyprland flake";
  };

  config = lib.mkIf (cfg.enable) {
    programs.hyprland = {
      enable = true;

      package =
        lib.mkIf cfg.useFlake
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        lib.mkIf cfg.useFlake
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

      withUWSM = true;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
