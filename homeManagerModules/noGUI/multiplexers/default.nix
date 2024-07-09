{ lib, ... }:

{
  imports = [
    ./tmux.nix
    ./zellij.nix
  ];

  settings.noGUI = {
    zellij.enable = lib.mkDefault true;
  };
}
