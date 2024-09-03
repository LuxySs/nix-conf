{ settings, lib, ... }:

let
  cfg.enable = builtins.elem "kde" settings.DE;
in
{
  config = lib.mkIf (cfg.enable) { services.desktopManager.plasma6.enable = true; };
}
