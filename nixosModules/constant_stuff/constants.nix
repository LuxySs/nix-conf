{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    vim
    git
    ripgrep
    tree
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flakes and nix-command
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
}
