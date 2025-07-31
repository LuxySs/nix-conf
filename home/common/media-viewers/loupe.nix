{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.loupe;
in
{
  options.settings.loupe.enable = lib.mkEnableOption "loupe media viewer";

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ loupe ]; };
}
