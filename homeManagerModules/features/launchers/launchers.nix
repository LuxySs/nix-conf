{ config, lib, ... }:
with lib;
let
  cfg = config.launchers;
in {
  imports = [ ./fuzzel/fuzzel.nix ];

  options.launchers = {
    enable = mkEnableOption "enable launchers module";
    enableFuzzel = mkEnableOption "enable fuzzel module";
  };

  config = mkIf cfg.enable {
    fuzzelModule.enable = cfg.enableFuzzel;
  };
}
