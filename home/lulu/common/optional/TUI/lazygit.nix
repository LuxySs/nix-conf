{ config, lib, ... }:

let
  cfg = config.settings.lazygit;
in
{
  options.settings.lazygit.enable = lib.mkEnableOption "lazygit";

  config = lib.mkIf (cfg.enable) {
    programs.lazygit.enable = true;
  };
}
