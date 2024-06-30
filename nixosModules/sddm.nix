{ config, lib, pkgs, ... }:

{
  options.settings.sddm.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.sddm.enable)  {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };

    environment.systemPackages = [(
      pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        fontSize = "13";
        loginBackground = true;
      }
    )];
  };
}
