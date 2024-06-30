{ config, lib, pkgs, ... }:

{
  options.settings.nix-ld.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.nix-ld.enable)  {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        vimPlugins.markdown-preview-nvim
      ];
    };
  };
}
