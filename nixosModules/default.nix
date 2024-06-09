{ config, pkgs, ... }:

{
  imports = [
    ./services/openssh.nix
    
  ];
}

