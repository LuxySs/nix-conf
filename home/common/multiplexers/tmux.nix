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
  options.settings.tmux = {
    enable = lib.mkEnableOption "tmux";
    tmux-sessionizer.enable = lib.mkEnableOption "tms";
  };

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
      ''
      + lib.optionalString cfg.tmux-sessionizer.enable ''
        bind C-o display-popup -E "tms"
        bind C-j display-popup -E "tms switch"
        bind C-w display-popup -E "tms windows"
        bind C-r "run-shell 'tms refresh'"
      '';

      # vim-like navigation
      customPaneNavigationAndResize = true;

      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        yank
      ];
    };

    home.packages = lib.mkIf cfg.tmux-sessionizer.enable [ pkgs.tmux-sessionizer ];

    xdg.configFile."tms/config.toml".text = lib.mkIf cfg.tmux-sessionizer.enable ''
      excluded_dirs = [
          ".direnv",
      ]

      [[search_dirs]]
      path = "/home/lulu/nix-conf"
      depth = 10

      [[search_dirs]]
      path = "/home/lulu/.config/nixcats-conf"
      depth = 10

      [[search_dirs]]
      path = "/home/lulu/Projects"
      depth = 10
    '';
  };
}
