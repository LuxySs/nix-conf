{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.java;
in
{
  options.settings.java.enable = lib.mkEnableOption "Java Development Kit";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      jdk22
    ];
  };
}
