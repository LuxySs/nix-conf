{ config, lib, ... }:

let
  cfg = config.settings.nixHelper;
in
{
  options.settings.nixHelper.enable = lib.mkDisableOption "nh (nix-helper)";

  config = lib.mkIf (cfg.enable) {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "monthly";
      };
    };
  };
}
