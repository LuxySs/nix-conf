{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.ags;
in
{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  options.settings.wm.ags.enable = lib.mkEnableOption "AGS (aylurs gtk shell)";

  config = lib.mkIf (cfg.enable) {
    programs.bun.enable = true;

    programs.ags = {
      enable = true;

      # null or path, leave as null if you don't want hm to manage the config
      # configDir = ./ags;

      # additional packages to add to gjs's runtime
      extraPackages = with pkgs; [
        accountsservice
        gtksourceview
      ];
    };

    # other programs used for ags
    home.packages = with pkgs; [
      sassc
    ];
  };
}
