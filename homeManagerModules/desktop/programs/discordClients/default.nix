{ config, lib, ... }:

let
  cfg = config.settings.discordClients;
in
{
  imports = [
    ./discord.nix
    ./vesktop.nix
    ./webcord.nix
  ];

  options.settings.discordClients = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "list of discordClients name";
  };

  config.settings.discordClient = {
    discord.enable = builtins.elem "discord" cfg;
    vesktop.enable = builtins.elem "vesktop" cfg;
    webcord.enable = builtins.elem "webcord" cfg;
  };
}
