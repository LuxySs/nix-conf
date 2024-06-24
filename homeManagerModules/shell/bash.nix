{ config, lib, ... }:

{
  options.settings.shell.bash.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enable bash";
  };

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
