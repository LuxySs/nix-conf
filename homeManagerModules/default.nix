{ lib, ... }:

{
  imports = [
    ./desktop
    ./shell
    ./games
    ./noGUI
  ];

  settings = {
    noGUI.enable = lib.mkDefault true;

    desktop.enable = lib.mkDefault true;

    shell = {
      bash.enable = lib.mkDefault true;
      fish.enable = lib.mkDefault true;
    };

    games.minecraft.enable = true;
  };
}
