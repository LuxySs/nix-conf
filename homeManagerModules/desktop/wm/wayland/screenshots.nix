{ config, lib, pkgs, ... }:

{

  options.settings.wm.screenshots.enable = lib.mkEnableOption "screenshots";

  config = lib.mkIf (config.settings.wm.screenshots.enable) {
    home.packages = with pkgs; [
      grim
      slurp
      wl-clipboard
      swappy
    ];
  };
}
