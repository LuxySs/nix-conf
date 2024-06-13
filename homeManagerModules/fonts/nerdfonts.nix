{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.nerdFontsModule;
in
{
  options.nerdFontsModule = {
      enable = lib.mkEnableOption "Enable nerd fonts";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs [
      iosevka-nerd
    ];
  };
}
