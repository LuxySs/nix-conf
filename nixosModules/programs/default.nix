{ ... }:

{
  imports = [
    ./fish.nix
    ./hyprDE/default.nix
    ./audio/pavucontrol.nix
  ];

  fishModule.enable = true;

  pavucontrolModule = {
    enable = true;
  };

  hyprDE = {
    enable = true;
    enableHyprland = true;
  };
}
