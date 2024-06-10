{ config, pkgs, ... }:

{
  imports = [
    ./services/default.nix
    ./bootloader/default.nix
    ./constant_stuff/default.nix
  ];
}

