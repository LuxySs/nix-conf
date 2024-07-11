{ config, lib, ... }:

let
  cfg = config.settings.mediaViewers;
in
{
  imports = [
    ./loupe.nix
    ./zathura.nix
  ];

  options.settings.mediaViewers = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "list of mediaViewers name";
  };

  config.settings.mediaViewer = {
    loupe.enable = builtins.elem "loupe" cfg;
    zathura.enable = builtins.elem "zathura" cfg;
  };
}
