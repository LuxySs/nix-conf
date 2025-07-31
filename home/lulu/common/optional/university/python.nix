{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.python;
in
{
  options.settings.python.enable = lib.mkEnableOption "Python3 Interpreter";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ python3 ]; };
}
