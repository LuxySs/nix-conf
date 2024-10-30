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

        setw -g mode-keys vi

        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      '';

      # vim-like navigation
      customPaneNavigationAndResize = true;

      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        yank
      ];

      shell = if fish_enabled then "${pkgs.fish}/bin/fish" else null;
    };
  };
}
