{
  config,
  inputs,
  lib,
  pkgs,
  settings,
  ...
}:

let
  cfg = config.settings.browser.firefox;
in
{
  options.settings.browser.firefox = {
    enable = lib.mkEnableOption "firefox";
    package = lib.mkPkgOption pkgs.firefox "firefox package";
  };

  config = lib.mkIf (cfg.enable) {
    programs.firefox = {
      enable = true;
      package = cfg.package;
      profiles.${settings.username} = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          vimium
        ];
      };
    };
  };
}
