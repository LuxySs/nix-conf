{ ... }:

{
  imports = [
    ./bluetooth.nix
    ./cache-substituters.nix
    ./docker.nix
    ./fish.nix
    ./gdm.nix
    ./gnome.nix
    ./hyprland.nix
    ./kde.nix
    ./minecraft-server.nix
    ./network-manager.nix
    ./nh.nix
    ./nvidia.nix
    ./sddm.nix
    ./services
    ./useful-programs.nix
    ./virtualization.nix
  ];
}
