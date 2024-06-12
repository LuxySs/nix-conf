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
        font = "font=Iosevka Nerd Font:size=13";
        dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      cursor = {
        color = "000000 ffffff";
      };
    };
  };
}
