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
    theme = lib.mkStrOption "gruvbox-dark-medium" "stylix theme";
  };

  config = lib.mkIf (cfg.enable) {

    stylix = {
      enable = true;

      image = ./../../../../../wallpapers/wallpaper.png;

      base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.theme}.yaml";

      cursor = {
        package = pkgs.banana-cursor;
        size = 30;
        name = "Banana";
      };

      targets = {
        firefox.profileNames = [ "lulu" ];
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
