{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.fishModule;
in
{
  options.fishModule = {
    enable = lib.mkEnableOption "Enable fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        coucou_fish = "echo this is the fish shell";
      };
    };
  };
}
