{ ... }:

{
  imports = [
    ./desktop
    ./shells
    ./TUIs
  ];

  settings.desktop.enable = true;

  settings.TUIs.enable = true;

  settings.shells.fish.enable = true;
  settings.shells.bash.enable = true;
}
