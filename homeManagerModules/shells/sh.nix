{ config, pkgs, ... }: {

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      coucou_fish = "echo this is the fish shell";
    };
  };
}
