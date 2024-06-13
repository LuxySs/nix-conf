{ ... }:

{
  imports = [
    ./hyprDE/default.nix
    ./audio/pavucontrol.nix
    ./spotify.nix
  ];

  pavucontrolModule = {
    enable = true;
  };

  hyprDE = {
    enable = true;
    enableHyprland = true;
    enableSwww = true;
  };

  spotifyModule.enable = true;
}
