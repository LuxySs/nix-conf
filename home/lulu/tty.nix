{ ... }:

{
  imports = [
    ./../../modules/homeManager
    ./common/core
    ./common/optional
  ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
  };

  settings = {
    ###### user-specific ######
    #### TUI
    bat.enable = true;
    eza.enable = true;
    git.enable = true;
    lazygit.enable = true;
    nixCats.enable = true;
    zellij.enable = true;

    #### Shell
    bash.enable = true;
    fish.enable = true;

    #### Theming
    stylix.enable = true;

    ###### shared across users ######
    #### TUI
    btop.enable = true;
    direnv.enable = true;
    yazi.enable = true;
  };
}
