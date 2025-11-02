{
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.settings.mangowc;
in
{
  imports = [ inputs.mango.nixosModules.mango ];

  options.settings.mangowc = {
    enable = lib.mkEnableOption "mangowc WM";
  };

  config = lib.mkIf (cfg.enable) {
    programs.mango.enable = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
