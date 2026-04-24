{ inputs, ... }:

{
  imports = [
    ####### HARDWARE #######
    ./hardware-configuration.nix
    ##### disk config
    inputs.disko.nixosModules.default
    ./disk-config.nix

    ##### CORE
    ./../common/core

    ##### OPTIONAL
    ./../common/optional

    ##### USERS
    ./../common/users/lulu
  ];

  networking.hostName = "dishwasher";

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    configurationLimit = 5;
  };

  nix.gc.dates = "weekly";

  settings = {
    nh.flakePath = "/home/lulu/.config/nix-conf";
    fish.enable = true;
    gnome.enable = true;
    mangowm.enable = true;
    nvidia = {
      enable = true;
      release = "stable";
    };
    gdm.enable = true;
    docker.enable = true;
    printing.enable = true;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
