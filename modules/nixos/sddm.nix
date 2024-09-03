{
  config,
  lib,
  pkgs,
  settings,
  ...
}:

let
  cfg = config.settings.sddm;

  # Define a function to conditionally include packages based on the presence of window managers
  selectPackages =
    wmList: pkgMap:
    builtins.filter (pkg: pkg != null) (
      map (wm: if builtins.elem wm wmList then pkgMap.${wm} else null) (builtins.attrNames pkgMap)
    );

  # Define the packages corresponding to each window manager
  wmPkgs = {
    hyprland = config.programs.hyprland.package;
    sway = config.programs.sway.package;
  };

in
{
  options.settings.sddm.enable = lib.mkDisableOption "sddm";

  config = lib.mkIf (cfg.enable) {
    services.displayManager = {
      sessionPackages = selectPackages settings.wm wmPkgs;

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
