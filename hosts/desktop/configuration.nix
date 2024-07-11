{ inputs, ... }:

{
  imports = [
    ./../../nixosModules
    ./../main-user.nix
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  main-user = {
    enable = true;
    userName = "lulu";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "lulu" = import ./home.nix;
    };
    useGlobalPkgs = true;
  };

  settings = {

    hyprland.enable = true;

    minecraftServer.enable = true;

    nvidia = {
      enable = true;
      release = "beta";
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
