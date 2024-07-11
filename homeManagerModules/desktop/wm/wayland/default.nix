{ config, lib, ... }:

let
  cfg = config.settings.wm.wayland;
in
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

  options.settings.wm.wayland.enable = lib.mkEnableOption "wayland";

  config = lib.mkIf (cfg.enable) {
    settings.wm = {
      ags.enable = lib.mkDefault true;
      brightness.enable = lib.mkDefault true;
      fuzzel.enable = lib.mkDefault true;
      hyprlock.enable = lib.mkDefault true;
      hypridle.enable = lib.mkDefault true;
      playerctl.enable = lib.mkDefault true;
      screenshots.enable = lib.mkDefault true;
      swww.enable = lib.mkDefault true;
      waybar.enable = lib.mkDefault true;
      wlogout.enable = lib.mkDefault true;
    };
  };
}
