{ pkgs, ... }:

{
  example = pkgs.callPackage ./example { };
  vague = pkgs.callPackage ./vague { };
}
