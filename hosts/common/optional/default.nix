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
    ./mangowm.nix
    ./minecraft-server.nix
    ./network-manager.nix
    ./nh.nix
    ./nvidia.nix
    ./printing.nix
    ./sddm.nix
    ./services
    ./useful-programs.nix
    ./virtualization.nix
  ];
}
