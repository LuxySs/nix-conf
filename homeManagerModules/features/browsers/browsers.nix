{ config, lib, ... }:

with lib;

let
  cfg = config.browsers;
in
{
  imports = [
    ./firefox/firefox.nix
  ];

  options.browsers = {
    enable = mkEnableOption "enable browsers module";
    enableFirefox = mkEnableOption "enable firefox module";
  };

  config = mkIf cfg.enable {
    firefoxModule.enable = cfg.enableFirefox;
  };
}
