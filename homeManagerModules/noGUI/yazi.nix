{ config, lib, ... }:

let
  cfg = config.settings.noGUI.yazi;
in
{
  options.settings.noGUI.yazi.enable = lib.mkEnableOption "yazi";

  config = lib.mkIf (cfg.enable) {
    programs.yazi = {
      enable = true;
    };
  };
}
