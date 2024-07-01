{ config, lib, pkgs, ... }:

{
  options.settings.nix-ld.enable = lib.mkDisableOption "nix-ld";

  config = lib.mkIf (config.settings.nix-ld.enable)  {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        vimPlugins.markdown-preview-nvim
      ];
    };
  };
}
