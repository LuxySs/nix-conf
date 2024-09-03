{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.minecraftServer;
in
{
  options.settings.minecraftServer.enable = lib.mkEnableOption "minecraft server";

  config = lib.mkIf (cfg.enable) {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 ];
    };

    environment.systemPackages = [ pkgs.minecraft-server ];
  };
}
