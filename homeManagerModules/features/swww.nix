{ lib, pkgs, config, ... }:

with lib;                      

let
  cfg = config.swwwModule;
in {
  options.swwwModule = {
    enable = mkEnableOption "enable swww";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.swww
    ];
  };
}
