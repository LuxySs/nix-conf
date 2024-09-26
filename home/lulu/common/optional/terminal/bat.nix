{ config, lib, ... }:

let
  cfg = config.settings.bat;
in
{
  options.settings.bat.enable = lib.mkEnableOption "bat";

  config = lib.mkIf cfg.enable {
    programs.bat.enable = true;
  };
}
