{ lib, config, pkgs, ... }:

{
  options.settings.noGUI.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf (config.settings.noGUI.neovim.enable) {
    home.packages = with pkgs; [
      neovim

      # lsps
      lua-language-server
      nixd
      clang-tools
      rust-analyzer
      nodePackages.typescript-language-server
      pyright
      texlab
      marksman

      # linters
      ruff

      # formatters
      stylua
    ];
  };
}
