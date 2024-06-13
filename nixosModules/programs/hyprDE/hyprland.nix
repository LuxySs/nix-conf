{ lib,  config, ... }:
with lib;                      
let
  cfg = config.hyprlandModule;
in {
  options.hyprlandModule = {
    enable = mkEnableOption "enable Hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };


    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    hardware.opengl = {
      enable = true;
      driSupport = true;
   };

    hardware.nvidia = {
      # nvidia specific
      modesetting.enable = true;

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
