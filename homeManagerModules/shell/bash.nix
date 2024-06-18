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
        myShell = "echo bash";
      };
    };
  };
}
