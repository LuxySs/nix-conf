{ config, lib, ... }:

with lib;

let
  cfg = config.yaziModule;
in
{
  options.yaziModule = {
      enable = lib.mkEnableOption "Enable yazi";
  };

  config = mkIf cfg.enable {
    programs.yazi = {
      enable = true;
    };
  };
}
