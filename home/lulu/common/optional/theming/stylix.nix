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
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  options.settings.stylix = {
    enable = lib.mkEnableOption "stylix";
    theme = lib.mkStrOption "gruvbox-dark-medium" "stylix theme";
  };

  config = lib.mkIf (cfg.enable) {

    stylix.enable = true;
    stylix.targets.hyprlock.enable = false;

    stylix.image = ./../../../../../wallpapers/wallpaper.png;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.theme}.yaml";

    stylix.cursor = {
      package = pkgs.banana-cursor;
      size = 10;
      name = "Banana";
    };

    stylix.fonts = {
      monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}
