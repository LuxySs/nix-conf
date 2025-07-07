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
    ./nh.nix
    ./nvidia.nix
    ./pipewire.nix
    ./sddm.nix
    ./services
    ./useful-programs.nix
    ./virt.nix
  ];
}
