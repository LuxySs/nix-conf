{ lib, config, pkgs, ... }:

{
  options.settings.emacs.enable = lib.mkEnableOption "emacs";

  config = lib.mkIf config.settings.emacs.enable {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs29-gtk3;
      extraPackages = epkgs: [
        epkgs.vterm
      ];
    };
  };
}
