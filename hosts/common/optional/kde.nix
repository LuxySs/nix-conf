{ config, lib, ... }:

let
  cfg = config.settings.kde;
in
{
  options.settings.kde.enable = lib.mkEnableOption "KDE DE";

  config = lib.mkIf (cfg.enable) { services.desktopManager.plasma6.enable = true; };
}
