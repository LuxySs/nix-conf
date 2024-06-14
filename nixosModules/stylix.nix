{ pkgs, ... }:

{
  stylix.enable = true;

  stylix.image = ./wallpaper.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";


  stylix.fonts  = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = [ "IosevkaTerm" ];};
      name = "IosevkaTerm";
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
}
