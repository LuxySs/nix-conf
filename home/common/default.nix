{ outputs, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./discord_clients
    ./eza.nix
    ./file_managers
    ./fzf.nix
    ./gtk.nix
    ./lazygit.nix
    ./man_pages.nix
    ./media_viewers
    ./multiplexers
    ./obs_studio.nix
    ./obsidian.nix
    ./pwvucontrol.nix
    ./spotify.nix
    ./yazi.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];

    config.allowUnfree = true;
  };
}
