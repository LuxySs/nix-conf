{ config, lib, ... }:

{
  options.settings.nix.substituters.cachix.enable = lib.mkDisableOption "Enable Cachix substituters for Nix";

  config = lib.mkIf config.settings.nix.substituters.cachix.enable {
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };
}
