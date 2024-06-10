{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.tmuxModule;
in
{
  options = {
    tmuxModule = {
      enable = lib.mkEnableOption "Enable Tmux";
    };
  };

  config = mkIf cfg.enable {
    programs.tmux.enable = true;
  };
}
