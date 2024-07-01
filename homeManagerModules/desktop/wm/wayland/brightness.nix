{ config, lib, pkgs, ... }:

{
  options.settings.wm.brightness.enable = lib.mkDisableOption "brightness";

  config = lib.mkIf (config.settings.wm.brightness.enable) {
    home.packages = with pkgs; [
      brightnessctl
    ];
  };
}
