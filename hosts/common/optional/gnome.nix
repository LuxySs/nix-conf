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
  options.settings.gnome = {
    enable = lib.mkEnableOption "GNOME DE";
    bloated = lib.mkEnableOption "Bloated GNOME Install (all the apps)";
  };

  config = lib.mkIf (cfg.enable) {
    services.xserver.desktopManager.gnome.enable = true;

    # Exclude the useless apps unless "bloated" was enabled
    services.gnome.rygel.enable = cfg.bloated;
    environment.systemPackages = with pkgs; [ gnome-tweaks ];
    environment.gnome.excludePackages = lib.mkIf (!cfg.bloated) (
      with pkgs;
      [
        atomix # Puzzle Game
        baobab # Disk Usage Analyzer
        cheese # Webcam Tool
        epiphany # Web Browser
        evince # Document Viewer
        file-roller # Archive Manager
        geary # Email Reader
        gedit # Text Editor
        gnome-characters
        gnome-clocks # Clocks
        gnome-color-manager # Color Profile Viewer
        gnome-connections # Connections
        gnome-contacts # Contacts
        gnome-disk-utility # Disk Usage Analyzer
        gnome-font-viewer # Fonts
        gnome-maps # Maps
        gnome-music
        gnome-photos
        gnome-system-monitor # System Monitor
        gnome-terminal # Trash terminal (not the console one)
        gnome-text-editor # Text Editor
        gnome-tour # A guided tour and greeter for GNOME
        gnome-weather # Weather
        hitori # Sudoku Game
        iagno # Go Game
        seahorse # Passwords and Keys
        simple-scan # Document Scanner
        tali # Poker Game
        totem # Video Player
      ]
    );
  };
}
