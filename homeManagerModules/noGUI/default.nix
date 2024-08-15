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
    ./multiplexers
    ./neovim.nix
    ./yazi.nix
    ./nixCats
  ];

  options.settings.noGUI.enable = lib.mkDisableOption "enable noGUI";

  config = lib.mkIf cfg.enable {
    settings.noGUI = {
      btop.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      multiplexers = lib.mkDefault [ "zellij" ];
      nixCats.enable = lib.mkDefault true;
      neovim.enable = lib.mkDefault false;
      yazi.enable = lib.mkDefault true;
    };
  };
}
