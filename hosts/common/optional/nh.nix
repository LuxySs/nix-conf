{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.nh;
in
{
  options.settings.nh = {
    enable = lib.mkDisableOption "nh (nix-helper)";
    flakePath = lib.mkStrOption "/home/lulu/.config/nix-conf" "flake path";
  };

  config = lib.mkIf (cfg.enable) {
    programs.nh = {
      enable = true;
      flake = cfg.flakePath;
    };
  };
}
