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

    noGUI.enable = lib.mkDefault true;

    shell = {
      bash.enable = lib.mkDefault true;
      fish.enable = lib.mkDefault true;
    };

    games.minecraft.enable = lib.mkDefault false;

  };
}
