{ ... }:

{
  imports = [
    ./hyprDE/default.nix
    ./audio/pavucontrol.nix
  ];

  pavucontrolModule = {
    enable = true;
  };

  hyprDE = {
    enable = true;
    enableHyprland = true;
    enableSwww = true;
  };
}
