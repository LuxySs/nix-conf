{ config, lib, ... }:

{
  options.settings.flatpak.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
    description = "flatpaks";
  };

  config = lib.mkIf (config.settings.flatpak.enable) {
    services.flatpak.enable = true;
  };
}
