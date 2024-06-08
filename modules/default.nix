{ config, pkgs, ... }:

{
  imports = [
    ./programs/hyprland.nix
    ./services/openssh.nix
    
  ];
}

