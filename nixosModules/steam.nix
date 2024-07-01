{ lib, config, ... }:

{
  options.settings.steam.enable = lib.mkEnableOption "Steam";

  config = lib.mkIf (config.settings.hyprland.enable)  {
    programs.steam = {
      enable = true;
    };
  };
}
