{ config, lib, ... }:

let
  cfg = config.settings.noGUI.btop;
in
{
  options.settings.noGUI.btop.enable = lib.mkEnableOption "btop";

  config = lib.mkIf (cfg.enable) { programs.btop.enable = true; };
}
