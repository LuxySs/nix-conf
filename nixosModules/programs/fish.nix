{ lib,  config, ... }:

with lib;                      

let
  cfg = config.fishModule;
in
{
  options.fishModule = {
    enable = mkEnableOption "enable fish shell";
  };

  config = mkIf cfg.enable {
    programs.fish.enable = true;
  };
}
