{ lib, pkgs, config, ... }:

{
  options.settings.wm.swww.enable = lib.mkEnableOption "swww";

  config = lib.mkIf (config.settings.wm.swww.enable) {
    home.packages = [
      pkgs.swww
    ];
  };
}
