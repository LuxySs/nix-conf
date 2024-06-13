{ ... }:

let
  bundleName = "hyprDE.nix";
in
{
  imports = [
    (./bundles + "/${bundleName}")
  ];
}
