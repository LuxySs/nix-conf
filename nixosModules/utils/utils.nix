{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.utils;
in
{
  options.utils = {
    enable = mkEnableOption "enable utils module";
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
