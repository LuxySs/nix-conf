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

        shell-integration-features = "no-cursor,no-sudo,no-title";

        confirm-close-surface = false;
        window-decoration = false;

        gtk-single-instance = true;
      };
    };
  };
}
