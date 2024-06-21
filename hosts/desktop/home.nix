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
}
