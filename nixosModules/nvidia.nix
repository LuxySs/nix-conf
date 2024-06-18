{ config, lib, ... }:

{
  options.settings.nvidia = {
    enable = lib.mkEnableOption {
      default = false;
      description = "nvidia";
    };
    open = lib.mkEnableOption {
      default = false;
      description = "nvidia open";
    };
    release = lib.mkOption {
      type = lib.types.enum ["stable" "beta"];
      default = "stable";
      description = "nvidia release";
    };
  };

  config = lib.mkIf (config.settings.nvidia.enable) {
    hardware.nvidia = {
      modesetting.enable = true;
      open = config.settings.nvidia.open; # should replace open = true to make it an option
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.${config.settings.nvidia.release};
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
