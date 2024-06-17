{ config, lib, ... }:

{
  options.settings.noGUI.tmux.enable = lib.mkEnableOption "tmux";

  config = lib.mkIf (config.settings.noGUI.tmux.enable) {
    programs.tmux.enable = true;
  };
}
