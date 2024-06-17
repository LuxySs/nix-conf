{ config, lib, inputs, pkgs, ... }:

{
  options.settings.webcord.enable = lib.mkEnableOption "webcord";

  config = lib.mkIf (config.settings.webcord.enable) {
    home.packages = [
        inputs.webcord.packages.${pkgs.system}.default
    ];
  };
}

