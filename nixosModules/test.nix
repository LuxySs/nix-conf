{ pkgs, lib, ... }:

{
  config = lib.mkIfCoucou ("coucou") {
    environment.systemPackages = [
      pkgs.cowsay
    ];
  };
}
