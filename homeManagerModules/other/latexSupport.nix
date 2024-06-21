{ lib, pkgs, config, ... }:

{
  options.settings.latexSupport.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
    description = "latex support";
  };

  config = lib.mkIf (config.settings.latexSupport.enable) {
    home.packages = [
      pkgs.texlive.combined.scheme-medium
    ];
  };
}
