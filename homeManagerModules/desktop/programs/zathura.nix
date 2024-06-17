{ config, lib, ... }: 

{
  options.settings.zathura.enable = lib.mkEnableOption "zathura";

  config = lib.mkIf (config.settings.zathura.enable) {
    programs.zathura.enable = true;
  };
}
