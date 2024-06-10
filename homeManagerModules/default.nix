{ config, pkgs, lib, ... }: {

  imports = [
    ./bars/default.nix
    ./editors/default.nix
    ./launchers/default.nix
    ./shells/default.nix
    ./terminals/default.nix
    ./multiplexers/default.nix
    ./wm/wm.nix
    ./browsers/browsers.nix
  ];

  options = {
    windowManagers = {
      enable = lib.mkEnableOption "Enable window managers";
      enableHyprland = lib.mkEnableOption "Enable Hyprland window manager";
    };
    browsers = {
      enable = lib.mkEnableOption "Enable browsers module";
      enableFirefox = lib.mkEnableOption "Enable Firefox browser";
    };
  };

  config = {
    windowManagers.enable = true;        # Enable window managers module
    windowManagers.enableHyprland = true;  # Default is false

    browsers.enable = true;  # Default is false
    browsers.enableFirefox = true;  # Default is false
  };
}

