{ config, lib, ... }:

with lib;

let
  cfg = config.btopModule;
in
{
  options.btopModule = {
      enable = lib.mkEnableOption "Enable btop";
  };

  config = mkIf cfg.enable {
    programs.btop.enable = true;
  };
}

