{
  config,
  lib,
  inputs,
  ...
}:

let
  cfg = config.settings.nvim;
in
{
  options.settings.nvim.enable = lib.mkEnableOption "nvim";

  imports = [
    inputs.myNvim.homeModules.default
  ];

  config = lib.mkIf cfg.enable {
    wrappers.neovim = {
      enable = true;
    };

    home.sessionVariables =
      let
        nvimpath = lib.getExe config.wrappers.neovim.wrapper;
      in
      {
        EDITOR = nvimpath;
      };
  };
}
