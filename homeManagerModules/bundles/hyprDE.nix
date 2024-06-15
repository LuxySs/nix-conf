{ ... }: 

{
  imports = [
    ../features/default.nix
  ];

  config = {
    agsModule.enable = true;

    bars = {
      enable = true;
      enableWaybar = true;
    };

    browsers = {
      enable = true;
      enableFirefox = true;
    };

    btopModule.enable = true;

    discordModule.enable = true;

    editors = {
      enable = true;
      enableNeovim = true;
      enableEmacs = true;
    };

    fileManagers = {
      enable = true;
      enableYazi = true;
    };

    gitModule.enable = true;

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

    spotifyModule = {
      enable = true;
    };

    terminals = {
      enable = true;
      enableFoot = true;
    };

    windowManagers = {
      enable = true;
      enableHyprland = true;
    };

  };
}
