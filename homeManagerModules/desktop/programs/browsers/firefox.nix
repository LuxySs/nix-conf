{
  config,
  inputs,
  lib,
  settings,
  ...
}:

let
  cfg = config.settings.browser.firefox;
in
{
  options.settings.browser.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf (cfg.enable) {
    programs.firefox = {
      enable = true;
      profiles.${settings.username} = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          vimium
        ];
      };
    };
  };
}
