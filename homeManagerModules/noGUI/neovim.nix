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
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
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

    /*
      disable the config file because I handle it separatly with the lazy
      plugin manager
    */
    xdg.configFile."nvim/init.lua".enable = false;
  };
}
