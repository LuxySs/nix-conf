{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.gcc;
in
{
  options.settings.gcc.enable = lib.mkEnableOption "gcc compiler";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ gcc ]; };
}
