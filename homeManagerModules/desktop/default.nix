{ config, lib, ... }:

let
  cfg = config.settings.desktop;
in
{
  imports = [
    ./programs
    ./wm
    ./gtk.nix
  ];

  options.settings.desktop.enable = lib.mkEnableOption "Default desktop configuration";

  config = lib.mkIf (cfg.enable) {
    settings = {
      programs.enable = lib.mkDefault true;
      wm.hyprland.enable = lib.mkDefault true;
    };
  };
}
