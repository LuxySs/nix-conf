{ config, lib, ... }:

let
  cfg = config.settings.foot;
in
{
  options.settings.foot.enable = lib.mkEnableOption "foot";

  config = lib.mkIf (cfg.enable) {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          term = "xterm-256color";
          font = lib.mkForce "IosevkaTermNerdFont:size=13";
          dpi-aware = lib.mkForce "yes";
        };
        colors = {
          alpha = lib.mkDefault "0.10";
        };
        cursor = {
          color = lib.mkDefault "000000 ffffff";
        };
        mouse = {
          hide-when-typing = "yes";
        };
        tweak = {
          font-monospace-warn = "no";
        };
      };
    };
  };
}
