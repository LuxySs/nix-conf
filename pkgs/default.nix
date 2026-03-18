{ pkgs, ... }:

rec {
  example = pkgs.callPackage ./example { };
  vague = pkgs.callPackage ./vague { };
  ioskeley-mono = pkgs.callPackage ./ioskeley-mono { };
  nerd-fonts.ioskeley-mono = pkgs.callPackage ./ioskeley-mono-nerd { inherit ioskeley-mono; };
}
