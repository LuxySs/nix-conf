{ lib, config, pkgs, inputs, ... }:

with lib;

let
  cfg = config.neovimModule;
in
{
  options.neovimModule = {
    enable = lib.mkEnableOption "enable neovim";
  };

  config = mkIf cfg.enable {
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
      source = ./nvim_conf;
      recursive = true;
    };
  };
}
