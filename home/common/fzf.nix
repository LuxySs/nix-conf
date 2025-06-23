{ config, lib, ... }:

let
  cfg = config.settings.fzf;
in
{
  options.settings.fzf.enable = lib.mkEnableOption "fzf";

  config = lib.mkIf cfg.enable {
    programs.fzf.enable = true;
  };
}
