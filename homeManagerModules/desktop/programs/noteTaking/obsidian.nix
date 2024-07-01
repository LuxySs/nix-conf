{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.settings.noteTaking.obsidian;
in
{
  options.settings.noteTaking.obsidian.enable = lib.mkEnableOption "obsidian";

  config = lib.mkIf (cfg.enable) { home.packages = [ pkgs.obsidian ]; };
}
