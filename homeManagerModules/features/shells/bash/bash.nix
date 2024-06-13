{ config, lib, ... }:

with lib;

let
  cfg = config.bashModule;
in
{
  options.bashModule = {
    enable = lib.mkEnableOption "Enable bash";
  };

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      # rather use fish shell but not recommended to
      # set it as $SHELL cuz not posix-compliant
      # initExtra = "fish";
      shellAliases = {
        myShell = "echo bash";
      };
    };
  };
}
