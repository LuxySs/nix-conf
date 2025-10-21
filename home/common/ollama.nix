{ config, lib, ... }:

let
  cfg = config.settings.ollama;
in
{
  options.settings.ollama.enable = lib.mkEnableOption "ollama";

  config = lib.mkIf (cfg.enable) {
    services.ollama.enable = true;
  };
}
