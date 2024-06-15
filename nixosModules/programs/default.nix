{ ... }:

{
  imports = [
    ./fish.nix
    ./hyprDE/default.nix
    ./audio/pavucontrol.nix
    ./spotify.nix
    ./nautilus.nix
  ];

  fishModule.enable = true;

  pavucontrolModule = {
    enable = true;
  };

  hyprDE = {
    enable = true;
    enableHyprland = true;
    enableSwww = true;
  };

  spotifyModule.enable = true;
  nautilusModule.enable = true;
}
