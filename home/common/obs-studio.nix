{ config, lib, ... }:

let
  cfg = config.settings.obs-studio;
in
{
  options.settings.obs-studio.enable = lib.mkEnableOption "OBS-studio";

  config = lib.mkIf (cfg.enable) {
    programs.obs-studio.enable = true;
  };
}
