{ config, lib, ... }:

{
  options.settings.nvidia = {
    enable = lib.mkEnableOption "nvidia";
    open = lib.mkEnableOption "nvidia open";

    release = lib.mkChoiceOption ["stable" "beta"] "stable" "nvidia release";
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
