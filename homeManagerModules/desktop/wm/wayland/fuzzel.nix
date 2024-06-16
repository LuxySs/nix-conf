{ config, pkgs, lib, ... }:

{
  options.settings.wm.fuzzel.enable = lib.mkEnableOption "fuzzel";

  config = lib.mkIf (config.settings.wm.fuzzel.enable) {
    programs.fuzzel.enable = true;
    programs.fuzzel.settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        layer = "overlay";
        prompt = "'❯ '";
        width = 65;
        lines = 13;
        line-height = 20;
        font = lib.mkForce "IosevkaTermNerdFont:weight=bold:size=15";
      };
      colors = {
        background = lib.mkDefault "24273add";
        text = lib.mkDefault "cad3f5ff";
        match = lib.mkDefault "ed8796ff";
        selection = lib.mkDefault "5b6078ff";
        selection-match = lib.mkDefault "ed8796ff";
        selection-text = lib.mkDefault "cad3f5ff";
        border = lib.mkDefault "51A4E7FF";
      } ;
      border = {
        radius = "20";
        width = "2";
      };
    };
  };
}
