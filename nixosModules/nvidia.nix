{ config, lib, ... }:

let
  cfg = config.settings.nvidia;
in
{
  options.settings.nvidia = {
    enable = lib.mkEnableOption "nvidia";
    open = lib.mkEnableOption "nvidia open";

    release = lib.mkChoiceOption [
      "beta"
      "stable"
    ] "stable" "nvidia release";

    nvidiaSettings = lib.mkEnableOption "nvidia settings";
  };

  config = lib.mkIf (cfg.enable) {
    hardware.nvidia = {
      modesetting.enable = true;
      open = cfg.open;
      nvidiaSettings = cfg.nvidiaSettings;
      package = config.boot.kernelPackages.nvidiaPackages.${config.settings.nvidia.release};
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
