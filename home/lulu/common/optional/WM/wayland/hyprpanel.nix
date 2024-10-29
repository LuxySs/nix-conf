{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.hyprpanel;
in
{
  options.settings.wm.hyprpanel.enable = lib.mkEnableOption "hyprpanel (preconfigured aylurs gtk shell)";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [ hyprpanel ];
  };
}
