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
    ./btop.nix
    ./multiplexer
    ./yazi.nix
  ];

  options.settings.TUI.enable = lib.mkEnableOption "enable TUI";

  config = lib.mkIf cfg.enable {
    settings = {
      btop.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
      zellij.enable = lib.mkDefault true;
    };
  };
}
