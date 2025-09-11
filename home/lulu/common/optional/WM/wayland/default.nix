{ config, lib, ... }:

let
  # true if at least one compositor is enabled
  compositorEnabled =
    with config.settings.wm;
    lib.ifAnyTrue [
      sway.enable
      hyprland.enable
    ];
in
{
  imports = [
    ./brightness.nix
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./playerctl.nix
    ./quickshell.nix
    ./screenshots.nix
    ./swww.nix
    ./waybar.nix
    ./wlogout
  ];

  settings.wm = lib.mkIf compositorEnabled {
    brightness.enable = lib.mkDefault true;
    fuzzel.enable = lib.mkDefault true;
    hypridle.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    playerctl.enable = lib.mkDefault true;
    quickshell.enable = lib.mkDefault true;
    screenshots.enable = lib.mkDefault true;
    swww.enable = lib.mkDefault false;
    waybar.enable = lib.mkDefault false;
    wlogout.enable = lib.mkDefault true;
  };
}
