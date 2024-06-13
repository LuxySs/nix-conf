{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.fuzzelModule;
in
{
  options.fuzzelModule = {
      enable = lib.mkEnableOption "Enable fuzzel";
  };

  config = mkIf cfg.enable {
    programs.fuzzel.enable = true;
    programs.fuzzel.settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        layer = "overlay";
        prompt = "'❯ '";
        width = 65;
        lines = 13;
        line-height = 20;
        font = mkForce "IosevkaTermNerdFont:weight=bold:size=15";
      };
      colors = {
        background = mkDefault "24273add";
        text = mkDefault "cad3f5ff";
        match = mkDefault "ed8796ff";
        selection = mkDefault "5b6078ff";
        selection-match = mkDefault "ed8796ff";
        selection-text = mkDefault "cad3f5ff";
        border = mkDefault "51A4E7FF";
      } ;
      border = {
        radius = "20";
        width = "2";
      };
    };
  };
}
