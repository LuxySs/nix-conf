{ pkgs, config, lib, ... }:

{
  options.settings.games.minecraft.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
    description = "minecraft";
  } ;

  config = lib.mkIf config.settings.games.minecraft.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}

