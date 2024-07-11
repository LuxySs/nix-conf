{ config, lib, ... }:

let
  cfg = config.settings.openssh;
in
{
  options.settings.openssh.enable = lib.mkDisableOption "openssh";

  config = lib.mkIf (cfg.enable) {
    services.openssh = {
      enable = true;
    };
  };
}
