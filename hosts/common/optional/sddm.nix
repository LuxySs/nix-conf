{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.sddm;

in
{
  options.settings.sddm.enable = lib.mkDisableOption "SDDM";

  config = lib.mkIf (cfg.enable) {
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha";
        package = lib.mkDefault pkgs.kdePackages.sddm;
      };
    };
  };
}
