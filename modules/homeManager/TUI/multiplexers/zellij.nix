{ config, lib, ... }:

let
  cfg = config.settings.zellij;
in
{
  options.settings.zellij.enable = lib.mkEnableOption "zellij";

  config = lib.mkIf (cfg.enable) { programs.zellij.enable = true; };
}
