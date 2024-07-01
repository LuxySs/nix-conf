{ config, lib, ... }:

let
  cfg = config.settings.zathura;
in
{
  options.settings.zathura.enable = lib.mkEnableOption "zathura";

  config = lib.mkIf (cfg.enable) { programs.zathura.enable = true; };
}
