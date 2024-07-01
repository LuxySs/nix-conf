{ config, lib, ... }:

let
  cfg = config.settings.noGUI.git;
in
{
  options.settings.noGUI.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf (cfg.enable) {
    programs.git = {
      enable = true;
      userEmail = lib.mkDefault "lucas.verbeiren@gmail.com";
      userName = lib.mkDefault "lulu";
    };
  };
}
