{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.multiplexers;
in
{
  imports = [
    ./tmux/tmux.nix
  ];

  config = mkIf cfg.enable {
    tmuxModule.enable = cfg.enableTmux;
  };
}
