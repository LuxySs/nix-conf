{ inputs, config, lib, ... }:

with lib;

let
  cfg = config.firefoxModule;
in
{
  options.firefoxModule = {
    enable = lib.mkEnableOption "Enable Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles.lulu = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          vimium
        ];
      };
    };
  };
}

