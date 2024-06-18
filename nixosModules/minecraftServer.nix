{ lib, config, pkgs, ... }:

{
  options.settings.minecraftServer.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
    description = "minecraft server";
  };

  config = lib.mkIf (config.settings.minecraftServer.enable)  {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 ];
    };

    environment.systemPackages = [
      pkgs.minecraft-server
    ];
  };
}
