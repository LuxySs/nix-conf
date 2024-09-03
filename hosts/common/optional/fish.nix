{ lib, config, ... }:

let
  cfg = config.settings.fish;
in
{
  options.settings.fish.enable = lib.mkDisableOption "fish shell";

  config = lib.mkIf (cfg.enable) { programs.fish.enable = true; };
}
