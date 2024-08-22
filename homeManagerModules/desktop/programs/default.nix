{ config, lib, ... }:

let
  cfg = config.settings.programs;
in
{
  imports = [
    ./browser
    ./discordClient
    ./emacs
    ./fileManager
    ./mediaViewer
    ./obsidian.nix
    ./pwvucontrol.nix
    ./spotify.nix
    ./terminal
  ];

  options.settings.programs.enable = lib.mkEnableOption "desktop programs";

  config = lib.mkIf (cfg.enable) {
    settings = {
      browser.firefox.enable = lib.mkDefault true;

      discordClient.vesktop.enable = lib.mkDefault true;

      emacs.enable = lib.mkDefault false;

      fileManager.nautilus.enable = lib.mkDefault true;

      mediaViewer = {
        loupe.enable = lib.mkDefault true;
        mpv.enable = lib.mkDefault true;
        zathura.enable = lib.mkDefault true;
      };

      obsidian.enable = lib.mkDefault true;

      pwvucontrol.enable = lib.mkDefault true;

      spotify.enable = lib.mkDefault true;

      terminal = {
        alacritty.enable = lib.mkDefault true;
        foot.enable = lib.mkDefault true;
        starshipPrompt.enable = lib.mkDefault true;
      };
    };
  };
}
