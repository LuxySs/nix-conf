{ ... }:

{
  imports = [
    ./common/core
    ./common/optional
    ./../../modules/homeManager
  ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
  };

  settings = {
    ###### user-specific ######
    #### WM
    wm.hyprland.enable = true;

    #### GUI
    firefox.enable = true;
    spotify.enable = true;
    starship.enable = true;

    #### TUI
    git.enable = true;
    nixCats.enable = true;

    #### Shell
    bash.enable = true;
    fish.enable = true;

    ###### shared across users ######
    #### GUI
    foot.enable = true;
    loupe.enable = true;
    mpv.enable = true;
    nautilus.enable = true;
    obsidian.enable = true;
    pwvucontrol.enable = true;
    vesktop.enable = true;
    zathura.enable = true;

    #### TUI
    btop.enable = true;
    direnv.enable = true;
    latex-support.enable = true;
    yazi.enable = true;
    zellij.enable = true;
  };
}
