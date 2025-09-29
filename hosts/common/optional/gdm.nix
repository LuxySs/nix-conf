{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.gdm;
in
{
  options.settings.gdm.enable = lib.mkEnableOption "gdm";

  config = lib.mkIf (cfg.enable) {
    services.displayManager.gdm.enable = true;
  };
}
