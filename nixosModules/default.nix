{ config, pkgs, ... }:

{
  imports = [
    ./services/openssh.nix
    ./programs/hyprland.nix
  ];
}

