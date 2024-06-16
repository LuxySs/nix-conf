{ config, lib, ... }:

{
  options.settings.TUIs.yazi.enable = lib.mkEnableOption "yazi";

  config = lib.mkIf (config.settings.TUIs.yazi.enable) {
    programs.yazi = {
      enable = true;
    };
  };
}
