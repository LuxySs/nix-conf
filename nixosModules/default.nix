{ ... }:

{
  imports = [
    ./services/default.nix
    ./bootloader/default.nix
    ./constant_stuff/default.nix
    ./programs/default.nix
    ./utils/utils.nix
  ];

  utils.enable = true;

}

