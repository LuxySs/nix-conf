{ lib, config, ... }:

let
  cfg = config.settings.steam;
in
{
  options.settings.steam.enable = lib.mkEnableOption "Steam";

  config = lib.mkIf (cfg.enable) {
    programs.steam = {
      enable = true;
    };
  };
}
