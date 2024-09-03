{
  inputs,
  pkgs,
  ...
}:

{
  imports =
    [
      ./disko-config.nix {_module.args = { device = "/dev/sda"; }; }
      ./hardware-configuration.nix
      ./../common
      inputs.home-manager.nixosModules.default
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "dishwasher";

  programs.fish.enable = true;

  # will have to move this in a users directory
  users.users.lulu = {
    description = "main user";
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  /* home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.lulu = {
      imports = [ ../../homeManagerModules/default.nix ];
    };
  }; */

  settings = {
    sddm.enable = true;
    minecraftServer.enable = true;
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
