{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.gnome;
in
{
  options.settings.gnome = {
    enable = lib.mkEnableOption "GNOME DE";
    core-apps.enable = lib.mkEnableOption "GNOME core apps";
    core-developer-tools.enable = lib.mkEnableOption "GNOME core developer tools";
    games.enable = lib.mkEnableOption "GNOME games";
  };

  config = lib.mkIf (cfg.enable) {
    services.desktopManager.gnome.enable = true;
    services.gnome = {
      core-os-services.enable = true;
      core-shell.enable = true;

      core-apps.enable = cfg.core-apps.enable;
      core-developer-tools.enable = cfg.core-developer-tools.enable;
      games.enable = cfg.games.enable;
    };
  };
}
