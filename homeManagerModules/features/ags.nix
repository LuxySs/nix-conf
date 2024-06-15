{ config, lib, inputs, pkgs, ... }:

with lib;

let
  cfg = config.agsModule;
in
{

  imports = [ inputs.ags.homeManagerModules.default ];

  options.agsModule = {
      enable = lib.mkEnableOption "Enable AGS";
  };

  config = mkIf cfg.enable {
    # add the home manager module

    programs.ags = {
      enable = true;

      # null or path, leave as null if you don't want hm to manage the config
      # configDir = ./ags;

      # additional packages to add to gjs's runtime
      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
  };
}
