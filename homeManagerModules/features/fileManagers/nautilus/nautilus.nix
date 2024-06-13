{ config, lib, ... }:

with lib;

let
  cfg = config.nautilusModule;
in
{
  options.nautilusModule = {
      enable = lib.mkEnableOption "Enable nautilus";
  };

  config = mkIf cfg.enable {
    programs.nautilus = {
      enable = true;
    };
  };
}
