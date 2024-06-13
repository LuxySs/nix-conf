{ config, pkgs, ... }: {
  imports =
    [
      ../../homeManagerModules/default.nix
    ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    stateVersion = "24.11";
  };

  # home.packages = with pkgs; [  
  #   (nerdfonts.override { fonts = [ "FiraCode" "IosevkaTerm" ]; })
  #   (iosevka-bin.override { variant = "Slab";})
  #   iosevka-bin
  # ];
}
