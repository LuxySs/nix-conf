{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.gtk;
in
{
  options.settings.wm.gtk = {
    iconTheme = {
      name = lib.mkStrOption "Papirus-Dark" "Icon theme name";
      package = lib.mkPkgOption pkgs.papirus-icon-theme "icon theme package";
    };
  };

  config = {
    gtk = {
      iconTheme = with cfg.iconTheme; {
        inherit package name;
      };
    };
  };
}
