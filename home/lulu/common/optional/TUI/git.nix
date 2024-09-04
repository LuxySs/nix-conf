{ config, lib, ... }:

let
  cfg = config.settings.git;
in
{
  options.settings.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf (cfg.enable) {
    programs.git = {
      enable = true;
      userName = "lulu";
      userEmail = "lucas.verbeiren@gmail.com";
    };
  };
}
