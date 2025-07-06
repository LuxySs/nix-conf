{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.alacritty;
in
{
  options.settings.alacritty.enable = lib.mkEnableOption "alacritty";

  config = lib.mkIf (cfg.enable) {
    programs.alacritty = {
      enable = true;

      settings = {
        cursor = {
          style = {
            shape = "Block";
          };
        };
        mouse = {
          hide_when_typing = true;
        };
      };
    };
  };
}
