{ lib, config, ... }: 

let
  cfg = config.settings.TUIs;
in
{
  imports = [
    ./multiplexers
    ./neovim
    ./btop.nix
    ./yazi.nix
  ];

  options.settings.TUIs.enable = lib.mkEnableOption "enable TUIs";

  config = lib.mkIf cfg.enable {
    settings.TUIs = {
      tmux.enable = true;
      neovim.enable = true;
      btop.enable = true;
      yazi.enable = true;
    };
  };
}
