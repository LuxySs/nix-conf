{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.firefoxModule;
in
{
  options.firefoxModule = {
    enable = lib.mkEnableOption "Enable Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles.lulu = {};
    };
  };
}

