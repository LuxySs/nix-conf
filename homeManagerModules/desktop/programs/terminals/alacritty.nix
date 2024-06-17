{ config, lib, ... }:

{
  options.settings.terminal.alacritty.enable = lib.mkEnableOption "alacritty";

  config = lib.mkIf (config.settings.terminal.alacritty.enable) {
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
          font-monospace-warn="no";
        };
      };
    };
  };
}
