{ ... }:

{
  settings = {
    ###### User-Specific ######
    #### terminal
    bat.enable = true;
    direnv.enable = true;
    eza.enable = true;
    fzf.enable = true;
    git.enable = true;
    lazygit.enable = true;
    man-pages.enable = true;
    nixCats.enable = true;
    tmux.enable = true;

    #### Shell
    bash.enable = true;
    fish.enable = true;

    #### Theming
    stylix.enable = true;

    #### University
    gcc.enable = true;
    latex-support.enable = true;
    python.enable = true;

    ###### Shared Across Users ######
    #### terminal
    btop.enable = true;
    yazi.enable = true;
  };
}
