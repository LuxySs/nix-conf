{ config, lib, ... }:

{
  options.settings.noGUI.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf (config.settings.noGUI.git.enable) {
    programs.git = {
      enable = true;
      userEmail = "lucas.verbeiren@gmail.com";
      userName = "lulu";
    };
  };
}

