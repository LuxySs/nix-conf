{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.games.steam;
in
{
  options.settings.games.steam.enable = lib.mkEnableOption "Steam";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.steam ]; };
}
