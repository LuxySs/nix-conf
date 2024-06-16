{ config, lib, ... }:

{
  options.settings.shells.bash.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enable bash";
  };

  config = lib.mkIf (config.settings.shells.bash.enable){
    programs.bash = {
      enable = true;
      shellAliases = {
        myShell = "echo bash";
      };
    };
  };
}
