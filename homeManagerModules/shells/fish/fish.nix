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
        myShell = "echo shell";
      };
      shellInit = ''
        set -g fish_greeting""
      '';
    };
  };
}
