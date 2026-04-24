{ config, lib, ... }:

let
  wm = config.settings.wm;

  compositorEnabled = lib.any (x: x) [
    wm.sway.enable
    wm.hyprland.enable
    wm.mangowm.enable
  ];

  hyprlandEnabled = wm.hyprland.enable;
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
    ./awww.nix
    ./waybar.nix
    ./wlogout
  ];

  config = lib.mkMerge [

    # generic compositor defaults
    (lib.mkIf compositorEnabled {
      settings.wm = {
        brightness.enable = lib.mkDefault true;
        fuzzel.enable = lib.mkDefault true;
        playerctl.enable = lib.mkDefault true;
        quickshell.enable = lib.mkDefault true;
        screenshots.enable = lib.mkDefault true;
        awww.enable = lib.mkDefault true;
        waybar.enable = lib.mkDefault false;
        wlogout.enable = lib.mkDefault true;
      };
    })

    # hyprland-specific defaults
    (lib.mkIf hyprlandEnabled {
      settings.wm.hypridle.enable = lib.mkDefault true;
      settings.wm.hyprlock.enable = lib.mkDefault true;
    })

  ];
}
