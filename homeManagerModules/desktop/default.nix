{ config,lib, ... }:

let
  cfg = config.settings.desktop;
in {
  imports = [
    ./programs
    ./wm
  ];

  options.settings.desktop.enable = lib.mkEnableOption "Default desktop configuration";

  config = lib.mkIf cfg.enable {
    settings = {
      wm = {
        hyprland.enable = true;
        sway.enable = false;
        fuzzel.enable = true;
        hyprlock.enable = true;
        screenshots.enable = true;
        swww.enable = true;
        waybar.enable = false;
        wlogout.enable = true;
      };

      files.nautilus.enable = lib.mkDefault true;

      # zathura.enable = lib.mkDefault true;
      browsers.firefox.enable = lib.mkDefault true;
      # browser.qutebrowser.enable = lib.mkDefault true;

      discord.enable = lib.mkDefault true;

      pavucontrol.enable = lib.mkDefault true;

      emacs.enable = lib.mkDefault true;

      ags.enable = lib.mkDefault true;

      spotify.enable = lib.mkDefault true;

      shells = {
        bash.enable = lib.mkDefault true;
        fish.enable = lib.mkDefault true;
      };

      terminal = {
        # default = lib.mkDefault "foot";
        foot.enable = lib.mkDefault true;
        alacritty.enable = lib.mkDefault true;
        starshipPrompt.enable = lib.mkDefault true;
      };

      # imageviewer.enable = lib.mkDefault true;
    };
  };
}
