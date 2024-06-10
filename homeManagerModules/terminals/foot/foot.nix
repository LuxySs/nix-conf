{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.footModule;
in
{
  options = {
    footModule = {
      enable = mkEnableOption "Enable Foot";
    };
  };

  config = mkIf cfg.enable {
    programs.foot.enable = true;
  };
}
