{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.discordClient.vesktop;
in
{
  options.settings.discordClient.vesktop.enable = lib.mkEnableOption "vesktop";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.vesktop ]; };
}
