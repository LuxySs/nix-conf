{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.gnome;
in
{
  options.settings.gnome.enable = lib.mkEnableOption "GNOME DE";

  config = lib.mkIf (cfg.enable) {
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages =
      (with pkgs; [
        gnome-photos
        gnome-music
        gnome-tour
        gnome-terminal
        gnome-characters
        cheese # webcam tool
        gedit # text editor
        epiphany # web browser
        geary # email reader
        evince # document viewer
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
      ]);

    # use pipewire instead of pulseaudio
    hardware.pulseaudio.enable = lib.mkForce false;
  };
}
