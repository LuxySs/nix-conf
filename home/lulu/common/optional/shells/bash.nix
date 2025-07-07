{ config, lib, ... }:

let
  cfg = config.settings.bash;
  aliases = import ./common_aliases.nix { inherit config lib; };
in
{
  options.settings.bash.enable = lib.mkEnableOption "enable bash";

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      shellAliases = aliases;
    };
  };
}
