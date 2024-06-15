{ ... }:

{
  imports = [
    ./fish.nix
    ./hyprDE/default.nix
    ./audio/pavucontrol.nix
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

  nautilusModule.enable = true;
}
