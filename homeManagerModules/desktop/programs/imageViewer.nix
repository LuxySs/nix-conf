{ pkgs, config, lib, ... }:

{
  options.settings.imageViewer.loupe.enable = lib.mkEnableOption "loupe image viewer";

  config = lib.mkIf (config.settings.imageViewer.loupe.enable) { 
    home.packages = [
      pkgs.loupe
    ];
  };
}
