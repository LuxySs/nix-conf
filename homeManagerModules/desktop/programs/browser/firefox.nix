{ inputs, config, lib, ... }:

{
  options.settings.browser.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf (config.settings.browser.firefox.enable) {
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

