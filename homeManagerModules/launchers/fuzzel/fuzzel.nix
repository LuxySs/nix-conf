{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.fuzzelModule;
in
{
  options.fuzzelModule = {
      enable = lib.mkEnableOption "Enable fuzzel";
  };

  config = mkIf cfg.enable {
    programs.fuzzel.enable = true;
  };
}
