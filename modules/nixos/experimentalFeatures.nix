{ config, lib, ... }:

let
  cfg = config.settings.experimentalFeatures;
in
{
  options.settings.experimentalFeatures.enable = lib.mkDisableOption "experimental features";

  config = lib.mkIf (cfg.enable) {
    nix.settings.experimental-features = [
      "flakes"
      "nix-command"
    ];
  };
}
