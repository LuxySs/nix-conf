{ ... }:

{
  imports = [
    ./bluetooth.nix
    ./cache-substituters.nix
    ./fish.nix
    ./gnome.nix
    ./hyprland.nix
    ./kde.nix
    ./minecraft-server.nix
    ./network-manager.nix
    ./nix-helper.nix
    ./nvidia.nix
    ./pipewire.nix
    ./sddm.nix
    ./services
    ./usefulPrograms.nix
    ./virt.nix
  ];
}
