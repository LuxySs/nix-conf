{ ... }: 

{
  imports = [
    ../features/default.nix
  ];

  config = {
    bars = {
      enable = true;
      enableWaybar = true;
    };

    browsers = {
      enable = true;
      enableFirefox = true;
    };

    btopModule.enable = true;

    editors = {
      enable = true;
      enableNeovim = true;
    };

    fileManagers = {
      enable = true;
      enableYazi = true;
    };

    launchers = {
      enable = true;
      enableFuzzel = true;
    };

    multiplexers = {
      enable = true;
      enableTmux = true;
    };

    nerdfonts = {
      enable = true;
    };

    prompts = {
      enable = true;
      enableStarship = true;
    };

    shells = {
      enable = true;
      enableBash = true;
      enableFish = true;
    };

    terminals = {
      enable = true;
      enableFoot = true;
    };

    # this one makes takes much time to install
    webcordModule.enable = true;

    windowManagers = {
      enable = true;
      enableHyprland = true;
    };
  };
}
