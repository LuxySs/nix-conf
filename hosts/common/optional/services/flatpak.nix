{ config, lib, ... }:

let
  cfg = config.settings.flatpak;
in
{
  options.settings.flatpak.enable = lib.mkEnableOption "flatpaks";

  config = lib.mkIf (cfg.enable) { services.flatpak.enable = true; };
}
