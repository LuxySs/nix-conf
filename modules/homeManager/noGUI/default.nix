{ 
  config,
  lib,
  ... 
}:

let
  cfg = config.settings.noGUI;
in
{
  imports = [
    ./btop.nix
    ./git.nix
    ./multiplexer
    ./neovim.nix
    ./nixCats
    ./yazi.nix
  ];

  options.settings.noGUI.enable = lib.mkDisableOption "enable noGUI";

  config = lib.mkIf cfg.enable {
    settings.noGUI = {
      btop.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      neovim.enable = lib.mkDefault false;
      nixCats.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
      zellij.enable = lib.mkDefault true;
      tmux.enable = lib.mkDefault true;
    };
  };
}
