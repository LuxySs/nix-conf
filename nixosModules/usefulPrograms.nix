{ pkgs, config, lib, ... }:

{
  options.settings.usefulPrograms.enable = lib.mkDisableOption "useful programs";

  config = lib.mkIf (config.settings.usefulPrograms.enable)  {
    environment.systemPackages = with pkgs; [
      #neovim
      ripgrep
      tree
    ];
  };
}
