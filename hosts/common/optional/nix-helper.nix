{ config, lib, ... }:

let
  cfg = config.settings.nixHelper;
in
{
  options.settings.nixHelper.enable = lib.mkDisableOption "nixHelper";

  config = lib.mkIf (cfg.enable) {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "monthly";
      };
      flake = "/home/lulu/nix-conf";
    };
  };
}
