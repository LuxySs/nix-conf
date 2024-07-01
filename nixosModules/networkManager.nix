{ config, lib, ... }:

let
  cfg = config.settings.networkManager;
in
{
  options.settings.networkManager.enable = lib.mkDisableOption "Network Manager";

  config = lib.mkIf (cfg.enable) { networking.networkmanager.enable = true; };
}
