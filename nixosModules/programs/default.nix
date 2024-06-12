{ config, pkgs, ... }:

{
  imports = [
    ./wm/wm.nix
  ];

  windowManagers = {
    enable = true;
    enableHyprland = true;
  };
}
