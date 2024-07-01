{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.nix-ld;
in
{
  options.settings.nix-ld.enable = lib.mkDisableOption "nix-ld";

  config = lib.mkIf (cfg.enable) {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [ vimPlugins.markdown-preview-nvim ];
    };
  };
}
