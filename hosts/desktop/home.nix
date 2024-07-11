{ myNixos, ... }:

{
  imports = [ ../../homeManagerModules/default.nix ];

  home = {
    username = myNixos.username;
    homeDirectory = "/home/${myNixos.username}";
    stateVersion = "24.11";
  };

  settings = {
    latexSupport.enable = true;
  };

  # disable stylix for kde cuz not working great/at all
  stylix.targets.kde.enable = false;
}
