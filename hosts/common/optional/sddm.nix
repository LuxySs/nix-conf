{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.sddm;
in
{
  options.settings.sddm = {
    enable = lib.mkEnableOption "SDDM";
    enableWayland = lib.mkDisableOption "wayland";
  };

  config = lib.mkIf (cfg.enable) {
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = cfg.enableWayland;
      };
    };
  };
}
