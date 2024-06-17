{ ... }:

{
  imports = [
    ./allowUnfree.nix
    ./audio.nix
    ./console.nix
    ./experimentalFeatures.nix
    ./fish.nix
    ./greeter.nix
    ./hyprland.nix
    ./locale.nix
    ./networkManager.nix
    ./nix.nix
    ./openssh.nix
    ./stylix.nix
    ./usefulPrograms.nix
  ];

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
}
