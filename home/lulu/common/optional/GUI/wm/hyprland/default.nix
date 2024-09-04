{
  inputs,
  lib,
  settings,
  pkgs,
  config,
  ...
}:

let
  cfg = {
    enable = builtins.elem "hyprland" settings.wm;
    useFlake = config.settings.wm.hyprland.useFlake;
  };
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
    useFlake = lib.mkDisableOption "Use flake for hyprland";
  };

  config = lib.mkMerge [
    (lib.mkIf (!cfg.useFlake) {
      wayland.windowManager.hyprland.package = pkgs.hyprland;
    })
    (lib.mkIf (cfg.enable) {
      settings.wm.wayland.enable = true; # toggle the wayland stuff
      wayland.windowManager.hyprland = {
        enable = true;
        package = lib.mkDefault inputs.hyprland.packages.${pkgs.system}.hyprland;
        systemd.enable = true;
        xwayland.enable = true;
      };
    })
  ];
}
