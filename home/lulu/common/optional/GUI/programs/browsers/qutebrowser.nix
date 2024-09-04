{ config, lib, ... }:

let
  cfg = config.settings.qutebrowser;
in
{
  options.settings.qutebrowser.enable = lib.mkEnableOption "qutebrowser";

  config = lib.mkIf (cfg.enable) { programs.qutebrowser.enable = true; };
}
