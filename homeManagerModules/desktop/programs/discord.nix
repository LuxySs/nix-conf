{ pkgs, config, lib, ... }:

{
  options.settings.discord.enable = lib.mkEnableOption "discord";

  config = lib.mkIf (config.settings.discord.enable) {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      discord
      vesktop
    ];
  };
}

