{ config, lib, ... }:

let
  cfg = config.settings.games;
in
{
  imports = [
    ./minecraft.nix
    ./steam.nix
  ];

  options.settings.games.enable = lib.mkEnableOption "enable games";

  config = lib.mkIf cfg.enable {
    settings.games = {
      minecraft.enable = lib.mkDefault true;
      steam.enable = lib.mkDefault true;
    };
  };
}
