{ config, lib, ... }:

{
  options.settings.networkManager.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.networkManager.enable)  {
    networking.networkmanager.enable = true;
  };
}
