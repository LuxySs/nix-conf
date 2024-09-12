{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.neovide;
in
{
  options.settings.neovide.enable = lib.mkEnableOption "neovide";

  config = lib.mkIf (cfg.enable) {
    home.packages = [ pkgs.neovide ];
  };
}
