{ lib,  config, ... }:

{
  options.settings.fish.enable = lib.mkDisableOption "fish shell";

  config = lib.mkIf (config.settings.fish.enable) {
    programs.fish.enable = true;
  };
}
