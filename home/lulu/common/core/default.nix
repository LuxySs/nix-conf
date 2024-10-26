{ lib, ... }:

{
  imports = [ ./monitors.nix ];

  home = {
    username = lib.mkDefault "lulu";
    homeDirectory = lib.mkDefault "/home/lulu";
    stateVersion = lib.mkDefault "24.11";
  };

  programs.home-manager.enable = true;
}
