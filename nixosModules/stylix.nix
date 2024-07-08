{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.settings.stylix;
in
{
  options.settings.stylix = {
    enable = lib.mkDisableOption "stylix";
    theme = lib.mkStrOption "catppuccin-mocha" "stylix theme";
  };

  config = lib.mkIf (cfg.enable) {

    stylix.enable = true;

    stylix.image = ./../wallpapers/wallpaper.png;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.theme}.yaml";

    stylix.fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "IosevkaTerm" ]; };
        name = "IosevkaTermNerdFont";
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
