{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.settings.games.minecraft;
in
{
  options.settings.games.minecraft.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
    description = "minecraft";
  };

  config = lib.mkIf (cfg.enable) { home.packages = with pkgs; [ prismlauncher ]; };
}
