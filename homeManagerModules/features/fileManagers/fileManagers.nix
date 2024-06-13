{ config, lib, ... }:

with lib;

let
  cfg = config.fileManagers;
in
{
  imports = [
    ./yazi/yazi.nix
    ./nautilus/nautilus.nix
  ];

  options.fileManagers = {
    enable = mkEnableOption "enable yazi module";
    enableYazi = mkEnableOption "enable yazi module";
    enableNautilus = mkEnableOption "enable nautilus module";
  };

  config = mkIf cfg.enable {
    yaziModule.enable = cfg.enableYazi;
    nautilusModule.enable = cfg.enableNautilus;
  };
}
