{ lib, config, ... }:

{
  options.settings.openssh.enable = lib.mkDisableOption "openssh";

  config = lib.mkIf (config.settings.openssh.enable)  {
    services.openssh = {
      enable = true;
    };
  };
}
