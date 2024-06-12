{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.terminals;
in
{
  imports = [
    ./foot/foot.nix
  ];

  options.terminals = {
    enable = mkEnableOption "enable terminals module";
    enableFoot = mkEnableOption "enable foot terminal";
  };

  config = mkIf cfg.enable {
    footModule.enable = cfg.enableFoot;
  };
}
