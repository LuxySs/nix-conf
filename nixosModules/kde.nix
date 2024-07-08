{ config, lib, ... }:

let
  cfg = config.settings.DE.kde;
in
{
  options.settings.DE.kde.enable = lib.mkEnableOption "KDE";

  config = lib.mkIf (cfg.enable) {
    services.desktopManager.plasma6.enable = true;

    services.displayManager.defaultSession = "plasma";
  };
}
