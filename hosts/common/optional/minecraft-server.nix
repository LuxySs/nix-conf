{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.minecraft-server;
in
{
  options.settings.minecraft-server.enable = lib.mkEnableOption "minecraft server";

  config = lib.mkIf (cfg.enable) {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 ];
    };

    environment.systemPackages = with pkgs; [ minecraft-server ];
  };
}
