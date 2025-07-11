{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.kitty;
in
{
  options.settings.kitty.enable = lib.mkEnableOption "kitty";

  config = lib.mkIf (cfg.enable) {
    programs.kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = -1;
        enable_audio_bell = false;
      };
    };
  };
}
