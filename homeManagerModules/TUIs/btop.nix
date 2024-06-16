{ config, lib, ... }:

{
  options.settings.TUIs.btop.enable = lib.mkEnableOption "btop";

  config = lib.mkIf (config.settings.TUIs.btop.enable) {
    programs.btop.enable = true;
  };
}

