{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.wezterm;
in
{
  options.settings.wezterm.enable = lib.mkEnableOption "wezterm";

  config = lib.mkIf (cfg.enable) {
    programs.wezterm = {
      enable = true;
      extraConfig = ''
        config.enable_tab_bar = false
        config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
        config.window_close_confirmation = "NeverPrompt"
      '';
    };
  };
}
