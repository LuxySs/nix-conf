{ config, lib, ... }:

{
  options.settings.noGUI.zellij.enable = lib.mkEnableOption "zellij";

  config = lib.mkIf (config.settings.noGUI.zellij.enable) {
    programs.zellij.enable = true;
  };
}
