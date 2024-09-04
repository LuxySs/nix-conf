{ lib, ... }:

{
  imports = [
    ./desktop
    ./games
    ./noGUI
    ./other
  ];

  settings = {

    desktop.enable = lib.mkDefault true;

    # don't want the games by default
    games.enable = lib.mkDefault false;

    noGUI.enable = lib.mkDefault true;
  };
}
