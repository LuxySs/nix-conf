{
  lib,
  config,
  ...
}:

let
  cfg = config.settings.wm.hyprland;
in
{
  imports = [
    ./../wayland # import the wayland utilities
    ./animations.nix
    ./inputs.nix
    ./keybindings.nix
    ./misc.nix
    ./settings.nix
    ./window.nix
    ./window_rules.nix
  ];

  options.settings.wm.hyprland = {
    enable = lib.mkEnableOption "Hyprland WM";
    animationsEnabled = lib.mkEnableOption "enable animations";
    smartGapsEnabled = lib.mkEnableOption "enable smart gaps";
  };

  config = lib.mkIf (cfg.enable) {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
    };
  };
}
