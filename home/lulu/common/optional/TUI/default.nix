{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.TUI;
in
{
  imports = [
    ./git.nix
    ./nixCats
  ];

  options.settings.TUI.enable = lib.mkEnableOption "Enable TUI Programs";

  config = lib.mkIf cfg.enable {
    settings.noGUI = {
      git.enable = lib.mkDefault true;
      nixCats.enable = lib.mkDefault true;
    };
  };
}
