{ lib, ... }:

{
  imports = [
    ./desktop
    ./games
    ./noGUI
    ./other
    ./shell
  ];

  settings = {

    desktop.enable = lib.mkDefault true;

    # don't want the games by default
    games.minecraft.enable = lib.mkDefault false;

    noGUI.enable = lib.mkDefault true;

    shell = {
      bash.enable = lib.mkDefault true;
      fish.enable = lib.mkDefault true;
    };
  };
}
