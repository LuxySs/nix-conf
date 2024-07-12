{ ... }:

let
  myNixos = {
    hostname = "dishwasher";
    username = "lulu";
    email = "lucas.verbeiren@gmail.com";
    wm = [ "sway" ];
  };
in
{
  imports = [ ../../homeManagerModules/default.nix ];

  home = {
    username = myNixos.username;
    homeDirectory = "/home/${myNixos.username}";
    stateVersion = "24.11";
  };

  settings = {
    latexSupport.enable = false;
  };

  # disable stylix for kde cuz not working great/at all
  stylix.targets.kde.enable = false;
}
