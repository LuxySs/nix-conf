{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.greeter;
in
{
  options.settings.greeter.enable = lib.mkEnableOption "greeter";

  config = lib.mkIf (cfg.enable) {
    services.greetd = {
      enable = true;
      settings = {
        default_session.command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --remember \
            --user-menu \
        '';
      };
    };
  };
}
