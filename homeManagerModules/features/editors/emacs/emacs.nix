{ lib, config, pkgs, inputs, ... }:

with lib;

let
  cfg = config.emacsModule;
in
{
  options.emacsModule = {
    enable = lib.mkEnableOption "enable emacs";
  };

  config = mkIf cfg.enable {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs29-gtk3;
      extraPackages = epkgs: [
        epkgs.vterm
      ];
    };
  };
}
