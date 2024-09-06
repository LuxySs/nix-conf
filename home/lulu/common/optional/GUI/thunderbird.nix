{ config, lib, ... }:

let
  cfg = config.settings.thunderbird;
in
{
  options.settings.thunderbird.enable = lib.mkEnableOption "Thunderbird mail client";

  config = lib.mkIf (cfg.enable) {
    programs.thunderbird = {
      enable = true;
      profiles.lulu.isDefault = true;
    };
  };
}
