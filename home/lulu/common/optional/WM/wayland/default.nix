{ lib, ... }:

{
  imports = [
    ./ags.nix
    ./brightness.nix
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./playerctl.nix
    ./screenshots.nix
    ./swww.nix
    ./waybar.nix
    ./wlogout
  ];

  settings.wm = {
    ags.enable = lib.mkDefault true;
    brightness.enable = lib.mkDefault true;
    fuzzel.enable = lib.mkDefault true;
    hypridle.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    playerctl.enable = lib.mkDefault true;
    screenshots.enable = lib.mkDefault true;
    swww.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault false;
    wlogout.enable = lib.mkDefault true;
  };
}
