{ lib, config, pkgs, ... }:

{
  options.settings.noGUI.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf (config.settings.noGUI.neovim.enable) {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    
      extraPackages = with pkgs; [
        # lsps
        lua-language-server
        nixd
	clang-tools
        rust-analyzer
        nodePackages.typescript-language-server
	pyright
	texlab
        marksman

        # # linters
        ruff

        # formatters
	stylua
      ];
    };


    xdg.configFile."nvim" = {
      source = ./conf;
      recursive = true;
    };
  };
}
