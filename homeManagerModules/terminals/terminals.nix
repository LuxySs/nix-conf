{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.terminals;
in
{
  imports = [
    ./foot/foot.nix
  ];

  config = mkIf cfg.enable {
    footModule.enable = cfg.enableFoot;
  };
}
