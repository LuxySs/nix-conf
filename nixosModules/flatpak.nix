{ config, lib, ... }:

{
  options.settings.flatpak.enable = lib.mkEnableOption "flatpaks";

  config = lib.mkIf (config.settings.flatpak.enable) {
    services.flatpak.enable = true;
  };
}
