{ ... }:

{
  imports = [
    ./desktop
    ./shells
    ./games
    ./noGUI
  ];

  settings.desktop.enable = true;

  settings.noGUI.enable = true;

  settings.shells.fish.enable = true;
  settings.shells.bash.enable = true;


  settings.games.minecraft.enable = true;
}
