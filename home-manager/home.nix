{ config, pkgs, ... }: {
  imports =
    [
      ./sh.nix
      ./terminal.nix
      ./editor.nix
      ./hyprland.nix
    ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    stateVersion = "24.11";
  };
}
