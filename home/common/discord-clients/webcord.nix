{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.webcord;
in
{
  options.settings.webcord.enable = lib.mkEnableOption "webcord";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [ webcord ];
  };
}
