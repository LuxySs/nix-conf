{ pkgs, lib, ... }:

{
  config = lib.mkIfCoucou ("coucou") {
    home.packages = [
      pkgs.cowsay
    ];
  };
}
