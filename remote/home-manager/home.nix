{ config, pkgs, ... }: {
  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    stateVersion = "24.05";
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      coucou_test = "echo coucou";
    };
  };
}
