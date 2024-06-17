{ lib, config, pkgs, ... }:

{
  options.settings.pavucontrol.enable = lib.mkEnableOption "pavucontrol";

  config = lib.mkIf (config.settings.pavucontrol.enable) {
    home.packages = [
      pkgs.pavucontrol
    ];
  };
}
