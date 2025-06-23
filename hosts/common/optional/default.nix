{ ... }:

{
  imports = [
    ./bluetooth.nix
    ./cache_substituters.nix
    ./fish.nix
    ./gnome.nix
    ./hyprland.nix
    ./kde.nix
    ./minecraft_server.nix
    ./network_manager.nix
    ./nix_helper.nix
    ./nvidia.nix
    ./pipewire.nix
    ./sddm.nix
    ./services
    ./useful_programs.nix
    ./virt.nix
  ];
}
