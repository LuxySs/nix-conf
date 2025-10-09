{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.vesktop;
in
{
  options.settings.vesktop.enable = lib.mkEnableOption "vesktop";

  config = lib.mkIf (cfg.enable) {
    programs.vesktop = {
      enable = true;
      settings = {
        enableSplashScreen = false;
      };
    };
  };
}
