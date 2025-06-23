{ config, lib, ... }:

let
  cfg = config.settings.yazi;
in
{
  options.settings.yazi.enable = lib.mkEnableOption "yazi";

  config = lib.mkIf (cfg.enable) {
    programs.yazi = {
      enable = true;
      settings = {
        opener = {
          open = [
            {
              run = ''xdg-open "$@"'';
              orphan = true;
            }
          ];
        };
      };
    };
  };
}
