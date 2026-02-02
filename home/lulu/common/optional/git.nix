{ config, lib, ... }:

let
  cfg = config.settings.git;
in
{
  options.settings.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf (cfg.enable) {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "lulu";
          email = "lucas.verbeiren@gmail.com";
        };

        alias = {
          lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
          lg1 = "log --oneline --abbrev-commit --all --graph --decorate --color";
        };
      };

      ignores = [
        ".env*"
        ".direnv"
      ];
    };
  };
}
