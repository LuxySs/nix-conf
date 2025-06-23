{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.discord;
in
{
  options.settings.discord.enable = lib.mkEnableOption "discord";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ discord ]; };
}
