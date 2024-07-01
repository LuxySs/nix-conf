{ config, lib, ... }:

let
  cfg = config.settings.browser.qutebrowser;
in
{
  options.settings.browser.qutebrowser.enable = lib.mkEnableOption "qutebrowser";

  config = lib.mkIf (cfg.enable) { programs.qutebrowser.enable = true; };
}
