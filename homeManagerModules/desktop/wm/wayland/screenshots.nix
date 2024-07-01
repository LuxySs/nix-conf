{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.screenshots;
in
{
  options.settings.wm.screenshots.enable = lib.mkEnableOption "screenshots";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      grim
      slurp
      wl-clipboard
      swappy
    ];
  };
}
