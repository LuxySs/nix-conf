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

        brightness.enable = true;
        fuzzel.enable = true;
        hyprlock.enable = true;
        screenshots.enable = true;
        swww.enable = true;
        waybar.enable = false;
        wlogout.enable = true;
      };

      files.nautilus.enable = lib.mkDefault true;

      zathura.enable = lib.mkDefault true;

      browser = {
        firefox.enable = lib.mkDefault true;
        qutebrowser.enable = lib.mkDefault true;
      };

      
      discord.enable = lib.mkDefault false;
      vesktop.enable = lib.mkDefault true;
      webcord.enable = lib.mkDefault false;

      pavucontrol.enable = lib.mkDefault true;

      emacs.enable = lib.mkDefault false;

      ags.enable = lib.mkDefault true;

      spotify.enable = lib.mkDefault true;

      terminal = {
        # default = lib.mkDefault "foot";
        foot.enable = lib.mkDefault true;
        alacritty.enable = lib.mkDefault true;
        starshipPrompt.enable = lib.mkDefault true;
      };

      imageViewer.loupe.enable = lib.mkDefault true;
    };
  };
}
