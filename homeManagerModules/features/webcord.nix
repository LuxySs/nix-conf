{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.webcordModule;
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  webcord = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/fufexan/webcord-flake/archive/master.tar.gz";
  }).defaultNix;
in
{
  options.webcordModule = {
      enable = lib.mkEnableOption "Enable webcord";
  };

  config = mkIf cfg.enable {
    home.packages = [ # or home.packages
      webcord.packages.${pkgs.system}.default
    ];
  };
}

