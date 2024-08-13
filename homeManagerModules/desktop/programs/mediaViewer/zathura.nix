{ config, lib, ... }:

let
  cfg = config.settings.mediaViewer.zathura;
in
{
  options.settings.mediaViewer.zathura.enable = lib.mkEnableOption "zathura";

  config = lib.mkIf (cfg.enable) { programs.zathura.enable = true; };
}
