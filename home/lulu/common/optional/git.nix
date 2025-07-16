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

      aliases = {
        lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        lg1 = "log --oneline --abbrev-commit --all --graph --decorate --color";
      };

      ignores = [
        ".env"
        ".envrc"
        ".direnv"
      ];
    };
  };
}
