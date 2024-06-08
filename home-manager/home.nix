{ config, pkgs, ... }: {
  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    stateVersion = "24.05";
  };

  programs.neovim = {
    enable = true;
  };

  programs.fuzzel = {
    enable = true;
  };

  programs.foot = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      coucou_test = "echo coucou";
    };
  };

  programs.bash = {
    enable = true;
  };
}
