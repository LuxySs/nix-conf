{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.bashModule;
in
{
  options = {
    bashModule = {
      enable = lib.mkEnableOption "Enable bash";
    };
  };

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      shellAliases = {
        coucou_bash = "echo this is the bash shell";
      };
    };
  };
}
