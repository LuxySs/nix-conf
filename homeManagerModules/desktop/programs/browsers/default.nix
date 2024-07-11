{ config, lib, ... }:

let
  cfg = config.settings.browsers;
in
{
  imports = [
    ./firefox.nix
    ./qutebrowser.nix
  ];

  options.settings.browsers = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "list of browsers name";
  };

  config.settings.browser = {
    firefox.enable = builtins.elem "firefox" cfg;
    qutebrowser.enable = builtins.elem "qutebrowser" cfg;
  };
}
