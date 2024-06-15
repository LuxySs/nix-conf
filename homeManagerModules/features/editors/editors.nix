{ config, lib, ... }:
with lib;
let
  cfg = config.editors;
in {
  imports = [ 
    ./neovim/neovim.nix
    ./emacs/emacs.nix
    ];

  options.editors = {
    enable = mkEnableOption "enable editors module";
    enableNeovim = mkEnableOption "enable neovim module";
    enableEmacs = mkEnableOption "enable emacs module";
  };

  config = mkIf cfg.enable {
    neovimModule.enable = cfg.enableNeovim;
    emacsModule.enable = cfg.enableEmacs;
  };
}
