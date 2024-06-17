{ config, lib, ... }:

{
  options.settings.greeter.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
    description = "greeter";
  };

  config = lib.mkIf (config.settings.greeter.enable) {
    services.greetd.enable = true;
  };
}
