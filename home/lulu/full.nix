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
    #### WM
    wm.hyprland.enable = true;

    #### GUI
    firefox.enable = true;
    foot.enable = true;
    spotify.enable = true;
    starship.enable = true;
    thunderbird.enable = true;

    #### TUI
    git.enable = true;
    nixCats.enable = true;

    #### Shell
    bash.enable = true;
    fish.enable = true;

    #### Theming
    stylix.enable = true;

    ###### shared across users ######
    #### GUI
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
    yazi.enable = true;
    zellij.enable = true;

    #### Other
    latex-support.enable = true;
  };
}
