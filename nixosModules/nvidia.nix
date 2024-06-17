{ config, lib, ... }:

{
  options.settings.nvidia = {
    enable = lib.mkEnableOption {
      type = lib.types.bool;
      default = true;
      description = "nvidia";
    };
    open = lib.mkEnableOption {
      type = lib.types.bool;
      default = false;
      description = "nvidia open";
    };
  };

  config = lib.mkIf (config.settings.nvidia.enable) {
    hardware.nvidia = {
      modesetting.enable = true;
      open = config.settings.nvidia.open; # should replace open = true to make it an option
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
