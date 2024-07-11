{ config, lib, ... }:

let
  cfg = config.settings.noGUI.multiplexers;
in
{
  imports = [
    ./tmux.nix
    ./zellij.nix
  ];

  options.settings.noGUI.multiplexers = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "list of multiplexers name";
  };

  config.settings.noGUI = {
    tmux.enable = builtins.elem "tmux" cfg;
    zellij.enable = builtins.elem "zellij" cfg;
  };
}
