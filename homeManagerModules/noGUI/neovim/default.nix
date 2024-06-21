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
        typescript

        nodePackages.typescript
        nodePackages.typescript-language-server

        nil
	rocmPackages_5.llvm.clang-unwrapped
        marksman
	pyright
        rust-analyzer-unwrapped
	texlab

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
