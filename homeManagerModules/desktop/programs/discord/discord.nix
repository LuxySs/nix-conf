{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.settings.discordClient.discord;
in
{
  options.settings.discordClient.discord.enable = lib.mkEnableOption "discord";

  config = lib.mkIf (cfg.enable) {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [ discord ];
  };
}
