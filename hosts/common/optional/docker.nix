{ config, lib, ... }:

let
  cfg = config.settings.docker;
in
{
  options.settings.docker.enable = lib.mkEnableOption "docker";

  config = lib.mkIf (cfg.enable) {
    virtualisation.docker.enable = true;
    users.users.lulu.extraGroups = [ "docker" ];
  };
}
