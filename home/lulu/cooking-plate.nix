{ ... }:

{
  imports = [
    ./../../modules/homeManager
    ./common/core
    ./common/optional
    ./bundles/full.nix
  ];

  monitors = [
    {
      name = "DP-1";
      width = 1920;
      height = 1200;
      refreshRate = 60.03;
    }
  ];
}
