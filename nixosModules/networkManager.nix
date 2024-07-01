{ config, lib, ... }:

{
  options.settings.networkManager.enable = lib.mkDisableOption "Network Manager";

  config = lib.mkIf (config.settings.networkManager.enable)  {
    networking.networkmanager.enable = true;
  };
}
