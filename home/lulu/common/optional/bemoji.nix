{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.bemoji;
in
{
  options.settings.bemoji.enable = lib.mkEnableOption "bemoji";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [ bemoji ];
  };
}
