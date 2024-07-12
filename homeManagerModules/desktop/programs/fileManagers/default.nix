{ config, lib, ... }:

let
  cfg = config.settings.fileManagers;
in
{
  imports = [ ./nautilus.nix ];

  options.settings.fileManagers = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "list of file-managers name";
  };

  config.settings.fileManager = {
    nautilus.enable = builtins.elem "nautilus" cfg;
  };
}
