{ ... }:

{
  imports = [
    ./../common
    ./common/core
    ./common/optional
    ./bundles/full.nix
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1200;
      refreshRate = 60.03;
    }
  ];

  # enable host-specific modules here
  settings = { };
}
