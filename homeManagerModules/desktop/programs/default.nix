{ config, lib, ... }:

let
  cfg = config.settings.programs;
in
{
  imports = [
    ./browsers
    ./discordClients
    ./emacs
    ./fileManagers
    ./mediaViewers
    ./obsidian.nix
    ./pavucontrol.nix
    ./spotify.nix
    ./terminals
  ];

  options.settings.programs.enable = lib.mkEnableOption "desktop programs";

  config = lib.mkIf (cfg.enable) {
    settings = {

      browsers = [ "firefox" ];

      discordClients = [ "vesktop" ];

      emacs.enable = lib.mkDefault false;

      fileManagers = lib.mkDefault [ "nautilus" ];

      mediaViewers = lib.mkDefault [
        "loupe"
        "zathura"
      ];

      pavucontrol.enable = lib.mkDefault true;
      obsidian.enable = lib.mkDefault true;
      spotify.enable = lib.mkDefault true;

      terminal = {
        emulators = lib.mkDefault [
          "alacritty"
          "foot"
        ];
        starshipPrompt.enable = lib.mkDefault true;
      };
    };
  };
}
