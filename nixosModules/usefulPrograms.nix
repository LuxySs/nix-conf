{ pkgs, config, lib, ... }:

{
  options.settings.usefulPrograms.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf (config.settings.usefulPrograms.enable)  {
    environment.systemPackages = with pkgs; [
      #neovim
      ripgrep
      tree
    ];
  };
}
