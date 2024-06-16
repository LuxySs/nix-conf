{ inputs, config, lib, ... }:

{
  options.settings.browsers.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf (config.settings.browsers.firefox.enable) {
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

