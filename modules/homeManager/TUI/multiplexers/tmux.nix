{ config, lib, ... }:

let
  cfg = config.settings.tmux;
in
{
  options.settings.tmux.enable = lib.mkEnableOption "tmux";

  config = lib.mkIf cfg.enable { programs.tmux.enable = true; };
}
