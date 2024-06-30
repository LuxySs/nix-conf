{ config, lib, ... }:

{
  options.settings.DE.kde.enable = lib.mkEnableOption {
    default = false;
  };

  config = lib.mkIf (config.settings.DE.kde.enable)  {
    # services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;

    services.displayManager.defaultSession = "plasma";
  };
}
