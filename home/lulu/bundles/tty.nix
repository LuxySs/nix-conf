{ ... }:

{
  settings = {

    ###### User-Specific ######

    nixCats.enable = true;
    bash.enable = true;
    fish.enable = true;
    stylix.enable = true;
    gcc.enable = true;
    python.enable = true;
    git.enable = true;

    ###### Shared Across Users ######
    
    tmux.enable = true;
    bat.enable = true;
    btop.enable = true;
    direnv.enable = true;
    eza.enable = true;
    fzf.enable = true;
    man-pages.enable = true;
    yazi.enable = true;
  };
}
