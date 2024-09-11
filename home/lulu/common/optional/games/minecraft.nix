{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.minecraft;
in
{
  options.settings.minecraft.enable = lib.mkEnableOption "minecraft (lunar client)";

  config = lib.mkIf (cfg.enable) {
    home.packages = [ pkgs.lunar-client ];
  };
}
