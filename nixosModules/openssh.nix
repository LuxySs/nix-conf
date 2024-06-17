{ lib, config, ... }:

{
  options.settings.openssh.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.openssh.enable)  {
    services.openssh = {
      enable = true;
    };
  };
}
