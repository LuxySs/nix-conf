{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

let
  cfg = config.settings.webcord;
in
{
  options.settings.webcord.enable = lib.mkEnableOption "webcord";

  config = lib.mkIf (cfg.enable) {
    home.packages = [ inputs.webcord.packages.${pkgs.system}.default ];
  };
}
