{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.footModule;
in
{
  options.footModule = {
      enable = mkEnableOption "Enable Foot";
  };

  config = mkIf cfg.enable {
    programs.foot.enable = true;
    programs.foot.settings = {
      main = {
        term = "xterm-256color";
        font = "IosevkaTermNerdFont:size=13";
        dpi-aware = "yes";
      };
      colors = {
        alpha="0.3";
        # foreground="222436";
        # background="2d3f76";
      };
      cursor = {
        color = "000000 ffffff";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      tweak = {
        font-monospace-warn="no";
      };
    };
  };
}
