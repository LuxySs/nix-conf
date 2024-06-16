{ config, lib, ... }:

with lib;

let
  cfg = config.windowManagers;
in
{
  imports = [
    ./hyprland/hyprland.nix
    ./wayland_utils.nix
  ];

  options.windowManagers = {
    enable = mkEnableOption "enable WM module";
    enableHyprland = mkEnableOption "enable hyprland WM";
  };

  config = mkIf cfg.enable {
    settings = {
      wm = {
        hyprland = {
          enable = true;
          useFlake = false; # Set to true if you want to use flake
          # useLegacyRenderer = false; # This option is removed, no need to set it
        };
      };
    };
  };
}

