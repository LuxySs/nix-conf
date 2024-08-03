{
  config,
  lib,
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
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      extraPackages = with pkgs; [
        # lsps
        clang-tools
        jdt-language-server
        lua-language-server
        marksman
        nixd
        nodePackages.typescript-language-server
        ruff-lsp
        rust-analyzer
        texlab

        # linters
        ruff

        # formatters
        nixfmt-rfc-style
        stylua

        # dap
        gdb
      ];
    };

    /*
      disable the config file because I handle it separatly with the lazy
      plugin manager
    */
    xdg.configFile."nvim/init.lua".enable = false;
  };
}
