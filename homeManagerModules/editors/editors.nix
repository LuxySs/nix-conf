{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.editors;
in {
  imports = [ ./neovim/neovim.nix ];

  options.editors = {
    enable = mkEnableOption "enable editors module";
    enableNeovim = mkEnableOption "enable neovim module";
  };

  config = mkIf cfg.enable {
    neovimModule.enable = cfg.enableNeovim;
  };
}
