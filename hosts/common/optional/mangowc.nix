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
  imports = [ inputs.mangowc.nixosModules.default ];

  options.settings.mangowc = {
    enable = lib.mkEnableOption "mangowc WM";
  };

  config = lib.mkIf (cfg.enable) {
    programs.mangowc.enable = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
