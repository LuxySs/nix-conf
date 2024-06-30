{ config, lib, ... }:

{
  options.settings.sddm.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.sddm.enable)  {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
