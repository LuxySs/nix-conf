{
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.settings.mangowm;
in
{
  imports = [ inputs.mango.nixosModules.mango ];

  options.settings.mangowm = {
    enable = lib.mkEnableOption "mango WM";
  };

  config = lib.mkIf (cfg.enable) {
    programs.mango.enable = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
