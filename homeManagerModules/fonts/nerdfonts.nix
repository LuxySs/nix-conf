{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.nerdfonts;
in
{
  options.nerdfonts = {
      enable = lib.mkEnableOption "Enable nerd fonts";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [  
      (nerdfonts.override { fonts = [ "FiraCode" "IosevkaTerm" ]; })
      # (iosevka-bin.override { variant = "Slab";})
      # iosevka-bin
    ];
  };
}
