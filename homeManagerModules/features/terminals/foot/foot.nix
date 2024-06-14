{ config, lib, ... }:

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
        font = mkForce "IosevkaTermNerdFont:size=13";
        dpi-aware = mkForce "yes";
      };
      colors = {
        alpha = mkDefault"0.10";
      };
      cursor = {
        color = mkDefault "000000 ffffff";
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
