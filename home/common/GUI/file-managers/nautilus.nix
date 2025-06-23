{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.settings.nautilus;
in
{
  options.settings.nautilus.enable = lib.mkEnableOption "nautilus";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ nautilus ]; };
}
