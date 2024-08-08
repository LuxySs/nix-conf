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
    services.displayManager = {
      sessionPackages = [
        config.programs.hyprland.package
        config.programs.sway.package
      ];

      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha";
        package = lib.mkDefault pkgs.kdePackages.sddm;
      };
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
