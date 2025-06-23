{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.gtk;
in
{
  options.settings.gtk = {
    iconTheme = {
      name = lib.mkStrOption "Papirus-Dark" "Icon theme name";
      package = lib.mkPkgOption pkgs.papirus-icon-theme "icon theme package";
    };
  };

  config = {
    gtk = {
      iconTheme = cfg.iconTheme;
    };
  };
}
