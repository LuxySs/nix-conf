{ config, pkgs, ... }: {
  imports =
    [
      ../../homeManagerModules/default.nix
    ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    stateVersion = "24.11";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = { };
  };

}
