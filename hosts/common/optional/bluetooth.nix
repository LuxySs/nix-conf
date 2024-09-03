{ config, lib, ... }:

let
  cfg = config.settings.bluetooth;
in
{
  options.settings.bluetooth.enable = lib.mkDisableOption "bluetooth";

  config = lib.mkIf (cfg.enable) {
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };
}
