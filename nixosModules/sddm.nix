{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.sddm;
in
{
  options.settings.sddm.enable = lib.mkDisableOption "sddm";

  config = lib.mkIf (cfg.enable) {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
    };

    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        fontSize = "13";
        loginBackground = true;
      })
    ];
  };
}
