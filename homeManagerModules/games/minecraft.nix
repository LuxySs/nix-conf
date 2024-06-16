{ pkgs, config, lib, ... }:

{
  options.settings.games.minecraft.enable = lib.mkEnableOption "git";

  config = lib.mkIf config.settings.games.minecraft.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}

