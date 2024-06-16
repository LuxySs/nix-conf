{ config, lib, ... }:

{
  options.settings.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf config.settings.git.enable {
    programs.git = {
      enable = true;
      userEmail = "lucas.verbeiren@gmail.com";
      userName = "lulu";
    };
  };
}

