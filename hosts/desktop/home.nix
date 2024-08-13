{ pkgs, settings, ... }:

{
  imports = [ ../../homeManagerModules/default.nix ];

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
    stateVersion = "24.11";
  };

  settings = {
    latexSupport.enable = true;
    games.enable = true;
  };

  # disable stylix for kde cuz not working great/at all
  stylix.targets.kde.enable = false;
}
