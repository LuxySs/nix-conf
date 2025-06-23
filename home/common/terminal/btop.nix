{ config, lib, ... }:

let
  cfg = config.settings.btop;
in
{
  options.settings.btop.enable = lib.mkEnableOption "btop";

  config = lib.mkIf (cfg.enable) { programs.btop.enable = true; };
}
