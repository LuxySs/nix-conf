{ lib, config, ... }: 

let
  cfg = config.settings.games;
in
{
  imports = [
    ./minecraft.nix
  ];

  options.settings.games.enable = lib.mkEnableOption "enable games";

  config = lib.mkIf cfg.enable {
    settings.games = {
      minecraft = {
        enable = true;
      };
    };
  };

}
