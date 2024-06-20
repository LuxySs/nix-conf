{ config, lib, inputs, pkgs, ... }:

{
  options.settings.vesktop.enable = lib.mkEnableOption "vesktop";

  config = lib.mkIf (config.settings.vesktop.enable) {
    home.packages = [
      pkgs.vesktop
    ];
  };
}

