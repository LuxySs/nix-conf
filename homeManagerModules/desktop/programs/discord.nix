{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.settings.discord;
in
{
  options.settings.discord.enable = lib.mkEnableOption "discord";

  config = lib.mkIf (cfg.enable) {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [ discord ];
  };
}
