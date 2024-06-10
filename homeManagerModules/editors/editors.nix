{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.editors;
in
{
  imports = [
    ./neovim/neovim.nix
  ];

  config = mkIf cfg.enable {
    neovimModule.enable = cfg.enableNeovim;
  };
}
