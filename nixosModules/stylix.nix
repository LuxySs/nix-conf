{ lib, config, pkgs, ... }:

{

  options.settings.stylix.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.stylix.enable) {

    stylix.enable = true;

    stylix.image = ./../hosts/desktop/wallpaper.png;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";


    stylix.fonts  = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = [ "IosevkaTerm" ];};
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
