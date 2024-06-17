{ lib, config, ... }:

{
  options.settings.experimentalFeatures.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.experimentalFeatures.enable)  {
    nix.settings.experimental-features = [ "flakes" "nix-command" ];
  };
}
