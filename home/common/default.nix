{ outputs, ... }:

{
  imports = [
    ./bat.nix
    ./bemoji.nix
    ./btop.nix
    ./direnv.nix
    ./discord-clients
    ./editors
    ./eza.nix
    ./file-managers
    ./fzf.nix
    ./lazygit.nix
    ./man-pages.nix
    ./media-viewers
    ./multiplexers
    ./obs-studio.nix
    ./obsidian.nix
    ./ollama.nix
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
