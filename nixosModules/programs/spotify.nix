{ lib,  config, pkgs, ... }:

with lib;                      

let
  cfg = config.spotifyModule;
in
{
  options.spotifyModule = {
    enable = mkEnableOption "enable spotify";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      spotify
    ];
  };
}
