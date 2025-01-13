{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.ghostty;
in
{
  options.settings.ghostty.enable = lib.mkEnableOption "ghostty";

  config = lib.mkIf (cfg.enable) {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;

      settings = {
        theme = "catppuccin-mocha";

        cursor-color = "ffffff";
        cursor-style = "block";
        cursor-style-blink = false;

        font-family = "Iosevka Nerd Font";
        font-size = 17;

        shell-integration-features = "no-cursor";

        confirm-close-surface = false;
        window-decoration = false;

        gtk-single-instance = true;
      };
    };
  };
}
