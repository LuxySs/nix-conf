{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.settings.noGUI.neovim;
in
{
  options.settings.noGUI.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      neovim

      # lsps
      lua-language-server
      nixd
      clang-tools
      rust-analyzer
      nodePackages.typescript-language-server
      ruff-lsp
      texlab
      marksman

      # linters
      ruff

      # formatters
      stylua
      nixfmt-rfc-style
    ];
  };
}
