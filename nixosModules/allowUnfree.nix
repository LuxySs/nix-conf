{ config, lib, ... }:

let
  cfg = config.settings.allowUnfree;
in
{
  options.settings.allowUnfree.enable = lib.mkDisableOption "allow unfree";

  config = lib.mkIf (cfg.enable) { nixpkgs.config.allowUnfree = true; };
}
