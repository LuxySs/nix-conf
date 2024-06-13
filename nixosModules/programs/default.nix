{ ... }:

{
  imports = [
    ./hyprDE/default.nix
    ./audio/pavucontrol.nix
  ];

  pavucontrolModule = {
    enable = true;
  };
}
