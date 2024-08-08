{
  settings,
  lib,
  pkgs,
  ...
}:

let
  cfg.enable = builtins.elem "gnome" settings.DE;
in
{
  config = lib.mkIf (cfg.enable) {
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages =
      (with pkgs; [
        gnome-photos
        gnome-tour
        cheese # webcam tool
        gnome-terminal
        gedit # text editor
        epiphany # web browser
        geary # email reader
        evince # document viewer
        totem # video player
      ])
      ++ (with pkgs.gnome; [
        gnome-music
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
      ]);
  };
}
