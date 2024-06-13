{ ... }:

{
  imports = [
    ./services/default.nix
    ./constant_stuff/default.nix
    ./programs/default.nix
    ./stylix.nix
    ./utils/utils.nix
  ];

  utils.enable = true;

}

