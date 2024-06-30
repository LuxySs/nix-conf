{ ... }: 

{
  imports = [
    ../../homeManagerModules/default.nix
  ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    stateVersion = "24.11";
  };

  settings = {
    latexSupport.enable = true;
  };

  # disable stylix for kde cuz not working great/at all
  stylix.targets.kde.enable = false;
}
