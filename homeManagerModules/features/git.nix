{ config, lib, ... }:

with lib;

let
  cfg = config.gitModule;
in
{
  options.gitModule = {
      enable = lib.mkEnableOption "Enable git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userEmail = "lucas.verbeiren@gmail.com";
      userName = "lulu";
    };
  };
}

