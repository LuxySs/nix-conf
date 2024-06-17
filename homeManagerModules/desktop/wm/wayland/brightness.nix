{ config, lib, pkgs, ... }:

{
  options.settings.wm.brightness.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
    description = "brightness";
  };

  config = lib.mkIf (config.settings.wm.brightness.enable) {
    home.packages = with pkgs; [
      brightnessctl
    ];
  };
}
