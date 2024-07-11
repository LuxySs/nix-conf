{ config, lib, ... }:

let
  cfg = config.settings.terminal.emulators;
in
{
  imports = [
    ./alacritty.nix
    ./foot.nix
    ./starship.nix # cool prompt
  ];

  options.settings.terminal.emulators = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "list of emulators name";
  };

  config.settings.terminal = {
    alacritty.enable = builtins.elem "alacritty" cfg;
    foot.enable = builtins.elem "foot" cfg;
  };
}
