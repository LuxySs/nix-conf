{ config, lib, ... }:

let
  cfg = config.settings.shell.bash;
in
{
  options.settings.shell.bash.enable = lib.mkDisableOption "enable bash";

  config = lib.mkIf (cfg.enable) {
    programs.bash = {
      enable = true;
      shellAliases = {
        "v" = "nvim";
        "vi" = "nvim";
        "vim" = "nvim";

        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
      };
    };
  };
}
