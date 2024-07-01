{ lib, config, ... }:

{
  options.settings.allowUnfree.enable = lib.mkDisableOption "allow unfree";

  config = lib.mkIf (config.settings.allowUnfree.enable)  {
    nixpkgs.config.allowUnfree = true;
  };
}
