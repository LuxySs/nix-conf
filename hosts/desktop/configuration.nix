{ inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./main-user.nix
      ../../nixosModules/locale/locale.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  main-user.enable = true;
  main-user.userName = "lulu";
  main-user.extraGroups = [ "wheel" "NetworkManager" ];

  locale.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "lulu" = import ./home.nix;
    };
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

