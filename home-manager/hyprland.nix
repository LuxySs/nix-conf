{ config, pkgs, ... }: {

  imports = [ 
  ./window-manager/fuzzel.nix
  ./window-manager/waybar.nix
  ];

}
