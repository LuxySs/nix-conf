{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.greeter;
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";
in
{
  options.settings.greeter.enable = lib.mkEnableOption "greeter";

  config = lib.mkIf (cfg.enable) {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session}";
          user = "greeter";
        };
      };
    };
  };
}
