{ lib, config, pkgs, ... }:

with lib;                      
let
  cfg = config.pavucontrolModule;
in {
  options.pavucontrolModule = {
    enable = mkEnableOption "enable pavu control";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.pavucontrol
    ];
  };
}
