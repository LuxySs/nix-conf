{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

let
  cfg = config.settings.discordClient.webcord;
in
{
  options.settings.discordClient.webcord.enable = lib.mkEnableOption "webcord";

  config = lib.mkIf (cfg.enable) {
    home.packages = [ inputs.webcord.packages.${pkgs.system}.default ];
  };
}
