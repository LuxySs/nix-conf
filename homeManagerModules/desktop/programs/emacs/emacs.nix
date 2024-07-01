{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.settings.emacs;
in
{
  options.settings.emacs.enable = lib.mkEnableOption "emacs";

  config = lib.mkIf (cfg.enable) {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs29-gtk3;
      extraPackages = epkgs: [ epkgs.vterm ];
    };
  };
}
