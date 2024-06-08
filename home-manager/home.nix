{ config, pkgs, ... }: {
  imports =
    [
      ./sh.nix
      ./terminal.nix
      ./editor.nix
    ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    stateVersion = "24.05";
  };

  programs.fuzzel = {
    enable = true;
  };
}
