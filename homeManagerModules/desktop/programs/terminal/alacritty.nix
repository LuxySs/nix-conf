{ config, lib, ... }:

let
  cfg = config.settings.terminal.alacritty;
in
{
  options.settings.terminal.alacritty.enable = lib.mkEnableOption "alacritty";

  config = lib.mkIf (cfg.enable) {
    programs.alacritty = {
      enable = true;

      settings = {
        main = {
          term = "xterm-256color";
          font = lib.mkForce "IosevkaTermNerdFont:size=13";
          dpi-aware = lib.mkForce "yes";
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
