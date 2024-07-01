{ lib, ... }:

{
  imports = [
    ./desktop
    ./shell
    ./games
    ./noGUI
    ./other
  ];

  settings = {
    noGUI.enable = lib.mkDefault true;

    desktop.enable = lib.mkDefault true;

    shell = {
      bash.enable = lib.mkDefault true;
      fish.enable = lib.mkDefault true;
    };

    games.minecraft.enable = lib.mkDefault false;
  };
}
