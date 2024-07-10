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
    ./terminal
    ./pavucontrol.nix
    ./noteTaking
    ./spotify.nix
    ./imageViewer.nix
    ./zathura.nix
  ];

  options.settings.programs.enable = lib.mkEnableOption "desktop programs";

  config = lib.mkIf (cfg.enable) {
    settings = {

      browser = {
        firefox.enable = lib.mkDefault true;
        qutebrowser.enable = lib.mkDefault false;
      };

      emacs.enable = lib.mkDefault false;

      files.nautilus.enable = lib.mkDefault true;

      noteTaking.obsidian.enable = lib.mkDefault true;

      terminal = {
        foot.enable = lib.mkDefault true;
        alacritty.enable = lib.mkDefault false;
        starshipPrompt.enable = lib.mkDefault true;
      };

      discordClient = {
        discord.enable = true;
        vesktop.enable = true;
        webcord.enable = false;
      };

      imageViewer.loupe.enable = lib.mkDefault true;

      pavucontrol.enable = lib.mkDefault true;

      spotify.enable = lib.mkDefault true;

      zathura.enable = lib.mkDefault true;
    };
  };
}
