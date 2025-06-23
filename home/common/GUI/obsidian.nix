{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.obsidian;
in
{
  options.settings.obsidian.enable = lib.mkEnableOption "obsidian";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.obsidian ]; };
}
