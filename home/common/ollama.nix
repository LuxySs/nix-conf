{ config, lib, ... }:

let
  cfg = config.settings.ollama;
in
{
  options.settings.ollama = {
    enable = lib.mkEnableOption "ollama";
    acceleration = lib.mkChoiceOption [
      "rocm"
      "cuda"
      null
    ] null "acceleration";
  };

  config = lib.mkIf (cfg.enable) {
    services.ollama = {
      enable = true;
      acceleration = cfg.acceleration;
    };
  };
}
