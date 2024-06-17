{ lib,  config, ... }:

{
  options.settings.fish.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
    enable = lib.mkEnableOption "fish shell";
  };

  config = lib.mkIf (config.settings.fish.enable) {
    programs.fish.enable = true;
  };
}
