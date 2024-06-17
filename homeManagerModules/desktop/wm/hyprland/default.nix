{ config, lib, pkgs, inputs, types, ... }:

{
  imports = [
    ./animations.nix
    ./inputs.nix
    ./keybindings.nix
    ./misc.nix
    ./settings.nix
    ./window.nix
    ./windowRules.nix
  ];

  options.settings.wm.hyprland = {
    enable = lib.mkEnableOption "hyprland";
  };
  options.settings.wm.hyprland.useFlake = lib.mkEnableOption {
    type = types.bool;
    default = true;
    description = "Use flake for hyprland";
  };

  config = lib.mkMerge [
    (lib.mkIf (!config.settings.wm.hyprland.useFlake) {
      wayland.windowManager.hyprland.package = pkgs.hyprland;
    })
    (lib.mkIf (config.settings.wm.hyprland.enable) {

      wayland.windowManager.hyprland = {
        enable = true;
        package = lib.mkDefault inputs.hyprland.packages."${pkgs.system}".hyprland;
        systemd.enable = true;
        xwayland.enable = true;
      };
    })
  ];
}

