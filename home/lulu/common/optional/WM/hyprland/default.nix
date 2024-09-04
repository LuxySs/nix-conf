{
  inputs,
  lib,
  pkgs,
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
    ./windowRules.nix
  ];

  options.settings.wm.hyprland = {
    enable = lib.mkEnableOption "Hyprland WM";
    useFlake = lib.mkDisableOption "Use flake for hyprland";
  };

  config = lib.mkMerge [
    (lib.mkIf (!cfg.useFlake) {
      wayland.windowManager.hyprland.package = pkgs.hyprland;
    })
    (lib.mkIf (cfg.enable) {
      wayland.windowManager.hyprland = {
        enable = true;
        package = lib.mkDefault inputs.hyprland.packages.${pkgs.system}.hyprland;
        systemd.enable = true;
        xwayland.enable = true;
      };
    })
  ];
}
