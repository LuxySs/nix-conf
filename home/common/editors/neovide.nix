{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.neovide;
in
{
  options.settings.neovide.enable = lib.mkEnableOption "neovide";

  config = lib.mkIf (cfg.enable) {
    programs.neovide.enable = true;
  };
}
