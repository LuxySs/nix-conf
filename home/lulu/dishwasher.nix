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
      name = "DP-1";
      width = 3440;
      height = 1440;
      refreshRate = 99.98;
    }
  ];

  # enable host-specific modules here
  settings = { };
}
