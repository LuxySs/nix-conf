{ config, lib, ... }:

{
  options.settings.noGUI.yazi.enable = lib.mkEnableOption "yazi";

  config = lib.mkIf (config.settings.noGUI.yazi.enable) {
    programs.yazi = {
      enable = true;
    };
  };
}
