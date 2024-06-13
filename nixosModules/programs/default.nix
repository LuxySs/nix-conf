{ config, pkgs, ... }:

{
  imports = [
    ./hyprDE/default.nix
  ];

  hyprDE = {
    enable = true;
    enableHyprland = true;
    enableSwww = true;
  };
}
