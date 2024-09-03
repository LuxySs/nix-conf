{
  inputs,
  pkgs,
  ...
}:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      
      ### HARDWARE ###
      ./hardware-configuration.nix
      # disk config
      ./disko-config.nix {_module.args = { device = "/dev/sda"; }; }

      ### CORE ###
      ./../common/core

      ### OPTIONAL ###
      ./../common/optional

      ### USERS ###
      ./../common/users/lulu
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "dishwasher";

  programs.fish.enable = true;

  settings = {
    sddm.enable = true;
    hyprland.enable = true;
    gnome.enable = true;
    nvidia = {
      enable = true;
      release = "stable";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
