{ ... }:

{
  settings = {

    ###### User-Specific ######

    wm.hyprland.enable = true;
    firefox.enable = true;
    nixCats.enable = true;
    bash.enable = true;
    fish.enable = true;
    foot.enable = true;
    stylix.enable = true;
    gcc.enable = true;
    python.enable = true;
    git.enable = true;
    starship.enable = true;

    ###### Shared Across Users ######

    bemoji.enable = true;
    vesktop.enable = true;
    nautilus.enable = true;
    loupe.enable = true;
    mpv.enable = true;
    zathura.enable = true;
    tmux = {
      enable = true;
      tmux-sessionizer.enable = true;
    };
    bat.enable = true;
    btop.enable = true;
    direnv.enable = true;
    eza.enable = true;
    fzf.enable = true;
    man-pages.enable = true;
    pwvucontrol.enable = true;
    spotify.enable = true;
    yazi.enable = true;
  };
}
