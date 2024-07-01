{ lib, config, ... }:

{
  options.settings.experimentalFeatures.enable = lib.mkDisableOption "experimental features";

  config = lib.mkIf (config.settings.experimentalFeatures.enable)  {
    nix.settings.experimental-features = [ "flakes" "nix-command" ];
  };
}
