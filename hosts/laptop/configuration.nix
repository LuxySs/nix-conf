{ inputs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ./hardware-configuration.nix
      ./main-user.nix
      ./../../nixosModules
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  main-user.enable = true;
  main-user.userName = "lulu";
  main-user.extraGroups = [ "wheel" "networkmanager" ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "lulu" = import ./home.nix;
    };
    useGlobalPkgs = true;
  };

  settings = {
    allowUnfree.enable = true;
    audio.pipewire.enable = true;

    console.keyMap = "us-acentos";

    experimentalFeatures.enable = true;
    fish.enable = true;
    greeter.enable = true;
    hyprland.enable = true;

    locale = {
      main = "en_US.UTF-8";
      timeZone = "Europe/Brussels";
    };

    networkManager.enable = true;
    openssh.enable = true;
    stylix.enable = true;
    usefulPrograms.enable = true;

    nix.substituters.cachix.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
