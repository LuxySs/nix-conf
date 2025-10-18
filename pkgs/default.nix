{ pkgs, ... }:

{
  example = pkgs.callPackage ./example { };
  vague = pkgs.callPackage ./vague { };
  ioskeley-mono = pkgs.callPackage ./ioskeley-mono { };
}
