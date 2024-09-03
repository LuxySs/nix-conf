{ ... }:

{
  imports = [
    ./common/core
    ./common/optional
  ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
  };

  settings = {
    fileManager.nautilus.enable = true;
    spotify.enable = true;
    firefox.enable = true;
  };
}
