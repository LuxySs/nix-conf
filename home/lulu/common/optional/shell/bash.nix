{ config, lib, ... }:

let
  cfg = config.settings.bash;
in
{
  options.settings.bash.enable = lib.mkEnableOption "enable bash";

  config = lib.mkIf (cfg.enable) {
    programs.bash = {
      enable = true;
      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
      };
    };
  };
}
