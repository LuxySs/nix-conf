{ config, lib, ... }:

with lib;

let
  cfg = config.multiplexers;
in
{
  imports = [
    ./tmux/tmux.nix
  ];

  options.multiplexers = {
    enable = mkEnableOption "enable multiplexers module";
    enableTmux = mkEnableOption "enable tmux module";
  };

  config = mkIf cfg.enable {
    tmuxModule.enable = cfg.enableTmux;
  };
}
