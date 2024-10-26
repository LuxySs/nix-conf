{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.tmux;

  fish_enabled = config.programs.fish.enable;
in
{
  options.settings.tmux.enable = lib.mkEnableOption "tmux";

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;

      extraConfig = ''
        set -ag terminal-overrides ",xterm-256color:RGB"

        set -sg escape-time 10
      '';

      # vim-like navigation
      customPaneNavigationAndResize = true;

      plugins = with pkgs; [ tmuxPlugins.vim-tmux-navigator ];

      shell = if fish_enabled then "${pkgs.fish}/bin/fish" else null;
    };
  };
}
