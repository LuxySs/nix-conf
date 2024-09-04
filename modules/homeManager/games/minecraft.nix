{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.games.minecraft;
in
{
  options.settings.games.minecraft.enable = lib.mkEnableOption "minecraft";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ lunar-client ]; };
}
