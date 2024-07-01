{ config, lib, ... }:

let
  cfg = config.settings.noGUI.tmux;
in
{
  options.settings.noGUI.tmux.enable = lib.mkEnableOption "tmux";

  config = lib.mkIf (cfg.enable) { programs.tmux.enable = true; };
}
