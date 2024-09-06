{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.kde;
in
{
  options.settings.kde = {
    enable = lib.mkEnableOption "KDE DE";
    bloated = lib.mkEnableOption "Bloated GNOME Install (all the apps)";
  };

  config = lib.mkIf (cfg.enable) {
    services.desktopManager.plasma6.enable = true;

    # Exclude the useless apps unless "bloated" was enabled
    environment.plasma6.excludePackages = lib.mkIf (!cfg.bloated) (
      with pkgs.kdePackages;
      [
        ark # Archive Manager
        elisa # Music Player
        gwenview # Image Viewer
        kate # Text Editor
        krdp # Remote Desktop
        kwallet # Kwallet
        okular # PDF Viewer
        plasma-disks # Disks Viewer
        spectacle # Screenshotting tool
      ]
    );
  };
}
