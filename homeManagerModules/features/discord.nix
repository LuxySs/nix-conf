{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.discordModule;
in
{
  options.discordModule = {
      enable = lib.mkEnableOption "Enable discord";
  };

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      discord
      vesktop
    ];
  };
}

