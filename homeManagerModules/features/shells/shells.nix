{ config, lib, ... }:

with lib;

let
  cfg = config.shells;
in
{
  imports = [
    ./bash/bash.nix
    ./fish/fish.nix
  ];

  options.shells = {
    enable = mkEnableOption "enable the shells module";
    enableBash = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the Bash module";
    };
    enableFish = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the Fish module";
    };
  };

  config = mkIf cfg.enable {
    bashModule.enable = cfg.enableBash;
    fishModule.enable = cfg.enableFish;
  };
}
