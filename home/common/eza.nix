{ config, lib, ... }:

let
  cfg = config.settings.eza;
in
{
  options.settings.eza.enable = lib.mkEnableOption "eza";

  config = lib.mkIf cfg.enable {
    programs.eza.enable = true;
  };
}
