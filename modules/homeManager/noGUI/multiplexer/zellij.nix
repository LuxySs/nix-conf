{ config, lib, ... }:

let
  cfg = config.settings.noGUI.zellij;
in
{
  options.settings.noGUI.zellij.enable = lib.mkEnableOption "zellij";

  config = lib.mkIf (cfg.enable) { programs.zellij.enable = true; };
}
