{ pkgs, config, lib, ... }:

{
  options.settings.noteTaking.obsidian.enable = lib.mkEnableOption "obsidian";

  config = lib.mkIf (config.settings.noteTaking.obsidian.enable) {
    home.packages = [
      pkgs.obsidian
    ];
  };
}
