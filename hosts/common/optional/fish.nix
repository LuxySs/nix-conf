{ lib, config, ... }:

let
  cfg = config.settings.fish;
in
{
  options.settings.fish.enable = lib.mkEnableOption "fish shell";

  config = lib.mkIf (cfg.enable) { programs.fish.enable = true; };
}
