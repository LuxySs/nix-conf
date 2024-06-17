{ config, lib, ... }:

{
  options.settings.noGUI.btop.enable = lib.mkEnableOption "btop";

  config = lib.mkIf (config.settings.noGUI.btop.enable) {
    programs.btop.enable = true;
  };
}

