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
    ./ags.nix
    ./brightness.nix
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprpanel.nix
    ./hyprlock.nix
    ./playerctl.nix
    ./screenshots.nix
    ./swww.nix
    ./waybar.nix
    ./wlogout
  ];

  settings.wm = lib.mkIf compositorEnabled {
    ags.enable = lib.mkDefault true;
    brightness.enable = lib.mkDefault true;
    fuzzel.enable = lib.mkDefault true;
    hypridle.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    hyprpanel.enable = lib.mkDefault false;
    playerctl.enable = lib.mkDefault true;
    screenshots.enable = lib.mkDefault true;
    swww.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault false;
    wlogout.enable = lib.mkDefault true;
  };
}
