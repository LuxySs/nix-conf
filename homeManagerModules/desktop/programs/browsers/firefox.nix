{
  config,
  inputs,
  lib,
  myNixos,
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
      profiles.${myNixos.username} = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          vimium
        ];
      };
    };
  };
}
