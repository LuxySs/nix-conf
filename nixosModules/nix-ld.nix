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
  options.settings.nix-ld = {
    enable = lib.mkDisableOption "nix-ld";
    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      description = "packages to install with nix-ld";
      default = [ ];
    };
  };

  config = lib.mkIf (cfg.enable) {
    programs.nix-ld = {
      enable = true;
      libraries = cfg.packages ++ [ pkgs.vimPlugins.markdown-preview-nvim ];
    };
  };
}
