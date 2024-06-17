{ lib, config, ... }: 

let
  cfg = config.settings.noGUI;
in
{
  imports = [
    ./multiplexers
    ./neovim
    ./btop.nix
    ./yazi.nix
    ./git.nix
  ];

  options.settings.noGUI.enable = lib.mkEnableOption "enable noGUI";

  config = lib.mkIf cfg.enable {
    settings.noGUI = {
      tmux.enable = true;
      neovim.enable = true;
      btop.enable = true;
      yazi.enable = true;
      git.enable = true;
    };
  };
}
