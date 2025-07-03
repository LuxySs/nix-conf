{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default

    ####### HARDWARE #######
    ./hardware-configuration.nix
    ##### disk config
    inputs.disko.nixosModules.default
    (import ./disko.nix { device = "/dev/sda"; })

    ##### CORE
    ./../common/core

    ##### OPTIONAL
    ./../common/optional

    ##### USERS
    ./../common/users/lulu
    { _module.args.host = "dishwasher"; }
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "dishwasher";

  settings = {
    nh.flakePath = "/home/lulu/nix-conf";
    fish.enable = true;
    gnome.enable = true;
    hyprland.enable = true;
    nvidia = {
      enable = true;
      release = "stable";
    };
    sddm.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
