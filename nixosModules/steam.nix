{ lib, config, ... }:

{
  options.settings.steam.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
    description = "Steam";
  };

  config = lib.mkIf (config.settings.hyprland.enable)  {
    programs.steam = {
      enable = true;
    };
  };
}
