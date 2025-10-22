{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default

    ####### HARDWARE #######
    ./hardware-configuration.nix
    ##### disk config
    inputs.disko.nixosModules.default
    (import ./disko.nix { device = "/dev/nvme0n1"; })

    ##### CORE
    ./../common/core

    ##### OPTIONAL
    ./../common/optional

    ##### USERS
    ./../common/users/lulu
  ];

  networking.hostName = "cooking-plate";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  settings = {
    nh.flakePath = "/home/lulu/.config/nix-conf";
    fish.enable = true;
    gnome.enable = true;
    hyprland.enable = true;
    sddm.enable = true;
    virtualization.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
