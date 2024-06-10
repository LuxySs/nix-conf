{ config, pkgs, lib, ... }: {

  imports = [
    ./bars/bars.nix
    ./browsers/browsers.nix
    ./editors/editors.nix
    ./terminals/terminals.nix
    ./wm/wm.nix
    ./launchers/launchers.nix
    ./multiplexers/multiplexers.nix
    ./shells/default.nix
  ];

  options = {
    bars = {
      enable = lib.mkEnableOption "Enable browsers module";
      enableWaybar = lib.mkEnableOption "Enable firefox browser";
    };
    browsers = {
      enable = lib.mkEnableOption "Enable browsers module";
      enableFirefox = lib.mkEnableOption "Enable firefox browser";
    };
    editors = {
      enable = lib.mkEnableOption "Enable editors module";
      enableNeovim = lib.mkEnableOption "Enable neovim editor";
    };
    launchers = {
      enable = lib.mkEnableOption "Enable launchers module";
      enableFuzzel = lib.mkEnableOption "Enable fuzzel launcher";
    };
    multiplexers = {
      enable = lib.mkEnableOption "Enable multiplexers module";
      enableTmux = lib.mkEnableOption "Enable tmux multiplexer";
    };
    terminals = {
      enable = lib.mkEnableOption "Enable terminals module";
      enableFoot = lib.mkEnableOption "Enable foot terminal";
    };
    windowManagers = {
      enable = lib.mkEnableOption "Enable window managers";
      enableHyprland = lib.mkEnableOption "Enable Hyprland window manager";
    };
  };

  config = {
    bars.enable = true;
    bars.enableWaybar = true;

    browsers.enable = true;
    browsers.enableFirefox = true;

    editors.enable = true;
    editors.enableNeovim = true;

    launchers.enable = true;
    launchers.enableFuzzel = true;

    multiplexers.enable = true;
    multiplexers.enableTmux = true;

    terminals.enable = true;
    terminals.enableFoot = true;

    windowManagers.enable = true;
    windowManagers.enableHyprland = true;
  };
}

