{ config, lib, ... }:

let
  cfg = config.settings.audio.pipewire;
in
{
  options.settings.audio.pipewire.enable = lib.mkDisableOption "pipewire";

  config = lib.mkIf (cfg.enable) {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      # pulse.enable = true;
    };
  };
}
