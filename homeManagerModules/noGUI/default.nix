{ config, lib, ... }:

let
  cfg = config.settings.noGUI;
in
{
  imports = [
    ./btop.nix
    ./git.nix
    ./multiplexers
    ./neovim.nix
    ./yazi.nix
  ];

  options.settings.noGUI.enable = lib.mkDisableOption "enable noGUI";

  config = lib.mkIf cfg.enable {
    settings.noGUI = {
      btop.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      multiplexers = lib.mkDefault [ "zellij" ];
      neovim.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
    };
  };
}
