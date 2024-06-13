{ config, lib, ... }:

with lib;

let
  cfg = config.fileManagers;
in
{
  imports = [
    ./yazi/yazi.nix
  ];

  options.fileManagers = {
    enable = mkEnableOption "enable yazi module";
    enableYazi = mkEnableOption "enable yazi module";
  };

  config = mkIf cfg.enable {
    yaziModule.enable = cfg.enableYazi;
  };
}
