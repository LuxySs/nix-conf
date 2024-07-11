{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.discordClient.discord;
in
{
  options.settings.discordClient.discord.enable = lib.mkEnableOption "discord";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ discord ]; };
}
