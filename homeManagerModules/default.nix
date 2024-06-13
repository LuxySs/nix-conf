{ config, pkgs, lib, ... }: {

  imports = [
    ./bars/bars.nix
    ./browsers/browsers.nix
    ./editors/editors.nix
    ./launchers/launchers.nix
    ./multiplexers/multiplexers.nix
    ./fonts/nerdfonts.nix
    # ./prompts/prompts.nix
    ./shells/shells.nix
    ./terminals/terminals.nix
    ./wm/wm.nix
  ];

  bars = {
    enable = true;
    enableWaybar = true;
  };

  browsers = {
    enable = true;
    enableFirefox = true;
  };

  editors = {
    enable = true;
    enableNeovim = true;
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

  # prompts = {
  #   enable = true;
  #   enableStarship = true;
  # };

  shells = {
    enable = true;
    enableBash = true;
    enableFish = true;
  };

  terminals = {
    enable = true;
    enableFoot = true;
  };

  windowManagers = {
    enable = true;
    enableHyprland = true;
  };
}
