{ config, lib, ... }:

{
  options.settings.shell.bash.enable = lib.mkDisableOption "enable bash";

  config = lib.mkIf (config.settings.shell.bash.enable){
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
