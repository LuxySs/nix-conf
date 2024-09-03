{ config, lib, ... }:

let
  cfg = config.settings.cachix;
in
{
  options.settings.cachix.enable = lib.mkDisableOption "Enable Cachix substituters for Nix";

  config = lib.mkIf (cfg.enable) {
    nix.settings.substituters = [ "https://hyprland.cachix.org" ];
    nix.settings.trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
}
