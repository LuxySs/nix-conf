{ config, lib, ... }:

let
  cfg = config.settings.programs;
in
{
  imports = [
    ./browser
    ./discord
    ./emacs
    ./files
    ./imageViewer.nix
    ./noteTaking
    ./pavucontrol.nix
    ./spotify.nix
    ./terminal
    ./zathura.nix
  ];

  options.settings.programs.enable = lib.mkEnableOption "desktop programs";

  config = lib.mkIf (cfg.enable) {
    settings = {

      browser = {
        firefox.enable = lib.mkDefault true;
        qutebrowser.enable = lib.mkDefault false;
      };

      discordClient = {
        discord.enable = true;
        vesktop.enable = true;
        webcord.enable = false;
      };

      emacs.enable = lib.mkDefault false;
      files.nautilus.enable = lib.mkDefault true;
      imageViewer.loupe.enable = lib.mkDefault true;
      noteTaking.obsidian.enable = lib.mkDefault true;
      pavucontrol.enable = lib.mkDefault true;
      spotify.enable = lib.mkDefault true;

      terminal = {
        alacritty.enable = lib.mkDefault false;
        foot.enable = lib.mkDefault true;
        starshipPrompt.enable = lib.mkDefault true;
      };

      zathura.enable = lib.mkDefault true;
    };
  };
}
