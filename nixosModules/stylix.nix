{ pkgs, ... }:

{
  stylix.enable = true;

  stylix = {
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };






}
