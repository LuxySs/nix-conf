{ config, lib, ... }:

let
  cfg = config.settings.direnv;
in
{
  options.settings.direnv.enable = lib.mkEnableOption "direnv";

  config = lib.mkIf (cfg.enable) {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
