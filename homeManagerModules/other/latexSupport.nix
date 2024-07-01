{ lib, pkgs, config, ... }:

{
  options.settings.latexSupport.enable = lib.mkEnableOption "latex support";

  config = lib.mkIf (config.settings.latexSupport.enable) {
    home.packages = [
      pkgs.texlive.combined.scheme-medium
    ];
  };
}
