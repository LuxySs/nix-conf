{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.stylix;
in
{
  imports = [ inputs.stylix.homeModules.stylix ];

  options.settings.stylix = {
    enable = lib.mkEnableOption "stylix";

    colorScheme = {
      name = lib.mkStrOption "gruvbox-dark-medium" "colorscheme name";
      package = lib.mkPkgOption pkgs.base16-schemes "colorscheme package";
    };

    wallpaper = lib.mkPathOption ./../../../../../wallpapers/black.png "wallpaper path";
  };

  config = lib.mkIf (cfg.enable) {
    stylix = {
      enable = true;

      image = cfg.wallpaper;

      base16Scheme = "${cfg.colorScheme.package}/share/themes/${cfg.colorScheme.name}.yaml";

      cursor = {
        package = pkgs.banana-cursor;
        size = 30;
        name = "Banana";
      };

      targets = {
        firefox.profileNames = [ "lulu" ];
      };

      icons = {
        enable = true;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
        package = pkgs.papirus-icon-theme;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.iosevka;
          name = "Iosevka NF";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sizes = {
          terminal = 15;
        };
      };
    };
  };
}
