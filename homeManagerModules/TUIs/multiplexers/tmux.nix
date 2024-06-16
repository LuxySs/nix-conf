{ config, lib, ... }:

{
  options.settings.TUIs.tmux.enable = lib.mkEnableOption "tmux";

  config = lib.mkIf (config.settings.TUIs.tmux.enable) {
    programs.tmux.enable = true;
  };
}
