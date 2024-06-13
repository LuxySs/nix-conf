{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.starshipModule;
in
{
  options.starshipModule = {
      enable = lib.mkEnableOption "Enable starship";
  };

  config = mkIf cfg.enable {
    {
      programs.starship = {
        enable = true;
        settings = {
          add_newline = false;
    
          character = {
            success_symbol = "[➜](bold green)";
            error_symbol = "[➜](bold red)";
          };
    
          # package.disabled = true;
        };
      };
    }


  };
}
