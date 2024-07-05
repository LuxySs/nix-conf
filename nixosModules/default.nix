{ ... }:

{
  imports = [
    ./allowUnfree.nix
    ./maintenance.nix
    ./nix-ld.nix
    ./kde.nix
    ./sddm.nix
    ./audio.nix
    ./bluetooth.nix
    ./flatpak.nix
    ./console.nix
    ./experimentalFeatures.nix
    ./fish.nix

    ./greeter.nix
    ./hyprland.nix
    ./locale.nix
    ./minecraftServer.nix
    ./networkManager.nix
    ./virt.nix

    ./cachix.nix
    ./nvidia.nix
    ./openssh.nix
    ./stylix.nix
    ./steam.nix
    ./usefulPrograms.nix
  ];
}
