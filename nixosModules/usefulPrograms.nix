{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.usefulPrograms;
in
{
  options.settings.usefulPrograms.enable = lib.mkDisableOption "useful programs";

  config = lib.mkIf (cfg.enable) {
    environment.systemPackages = with pkgs; [
      #neovim
      ripgrep
      tree
    ];
  };
}
