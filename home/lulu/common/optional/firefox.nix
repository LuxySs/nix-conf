{ config, lib, ... }:

let
  cfg = config.settings.firefox;
in
{
  options.settings.firefox.enable = lib.mkDisableOption "firefox";

  config = lib.mkIf (cfg.enable) {
    programs.firefox.enable = true;
  };
}
