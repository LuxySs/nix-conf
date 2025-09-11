{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.settings.wm.quickshell;
in
{
  options.settings.wm.quickshell.enable = lib.mkEnableOption "quickshell";

  config = lib.mkIf (cfg.enable) {
    qt.enable = true;

    programs.quickshell = {
      enable = true;
      package = inputs.quickshell.packages.${pkgs.system}.default.withModules [
        pkgs.kdePackages.qtsvg
        pkgs.kdePackages.qtimageformats
        pkgs.kdePackages.qtmultimedia
        pkgs.kdePackages.qt5compat
      ];
    };
  };
}
