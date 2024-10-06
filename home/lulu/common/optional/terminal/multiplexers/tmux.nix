{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.tmux;
in
{
  options.settings.tmux.enable = lib.mkEnableOption "tmux";

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;

      extraConfig = ''
        set -ag terminal-overrides ",xterm-256color:RGB"

        set -g status-interval 60

        # vim-like pane switching
        setw -g mode-keys vi
        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R
      '';

      plugins = with pkgs; [ tmuxPlugins.vim-tmux-navigator ];
    };
  };
}
