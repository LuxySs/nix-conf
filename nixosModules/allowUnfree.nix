{ lib, config, ... }:

{
  options.settings.allowUnfree.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.allowUnfree.enable)  {
    nixpkgs.config.allowUnfree = true;
  };
}
